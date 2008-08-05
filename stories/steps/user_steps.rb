require File.expand_path(File.dirname(__FILE__) + "/../helper")

steps_for :users do
  Given 'a user' do
    @user = User.generate
    ActionView::Base.send :define_method, :current_user, lambda { @user }
    ActionView::Base.send :define_method, :current_user=, lambda {|u| @user = u }
  end
  When 'the feature \'$feat\' is enabled for the user' do |featurename|
    @user.enable_tester(featurename)
  end
  
  When 'the feature \'$feat\' is disabled for the user' do |featurename|
    @user.disable_tester(featurename)
  end
end
