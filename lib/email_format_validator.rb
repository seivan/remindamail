class EmailFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors[attribute] << "Your email is missing the @ sign" unless value =~ /@/
      record.errors[attribute] << "Your email address should end with .com. .se, .co.uk and etc" unless value =~ /\.[^\.]+$/
      record.errors[attribute] << "You must have an address before the @ sign" unless value =~ /^.+@/
      record.errors[attribute] << "Your email should look similar to something@else.xxx" unless value =~ /^[^@]+@[^@]+$/
    end
end