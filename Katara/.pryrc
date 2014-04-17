# Load plugins (only those I whitelist)
Pry.config.should_load_plugins = false

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below 
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
  else
    #warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end

singdb = File.join Dir.getwd, 'db/setup.rb'
sing = File.join Dir.getwd, 'sing.rb'
load sing if File.exist?(sing) and File.exist?(singdb) and ENV['SKIP_SING'].nil?

Pry.config.prompt = [proc { "> " },
                     proc { "~ " }]

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'