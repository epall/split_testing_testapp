require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :features, :users, :pages do
  run File.join(File.dirname(__FILE__), 'enabling.txt'), :type => RailsStory
end