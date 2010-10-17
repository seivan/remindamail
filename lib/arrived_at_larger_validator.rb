class ArrivedAtLargerValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors[attribute] << "Arrived at must be after today" if value <= Date.today
    end
end