# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :bundle_command, '/home/mateus-vieira/Documents/Escala/escala_dib/bin/bundle exec'
set :bundle_command, '/home/mateus-vieira/.asdf/shims/bundle exec'

set :output, './cron_log.log'

# every '* * 25 * *' do
#   rake 'sc:create_schedule'
# end

# every '* * 1 * *' do
#   rake 'sc:delete_schedule'
# end

every 3.minutes do
  rake 'sc:create_schedule'
end

every 2.minutes do
  rake 'sc:delete_schedule'
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
