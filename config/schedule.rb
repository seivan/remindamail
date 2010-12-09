set :output, {:error => 'error.log', :standard => 'cron.log'}
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 #set :output, "/home/remindamail/applications/sender/mailer.log"
#
#env :GEM_PATH, "/home/remindamail/.rvm/gems/ruby-1.9.2-p0"
 every 1.minute do
  command "ruby /home/remindamail/remindamail-sender/schema.rb"
   #runner "MyModel.some_method"
   #rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
