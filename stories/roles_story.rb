require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :roles, :features, :users, :pages do
  run File.join(File.dirname(__FILE__), 'roles.txt'), :type => RailsStory
end