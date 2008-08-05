require File.expand_path(File.dirname(__FILE__) + "/../helper")

steps_for :roles do
  Given 'a role \'$a\'' do |rolename|
    @roles ||= {}
    @roles[rolename] = SplitTesting::Role.generate(:name => rolename)
  end
  
  When 'the user has the role \'$a\'' do |rolename|
    @user.roles << @roles[rolename]
  end
  
  When 'the role \'$a\' is enabled for feature \'$b\'' do |rolename, featurename|
    @roles[rolename].features << @features[featurename]
  end
end