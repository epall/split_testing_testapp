require File.expand_path(File.dirname(__FILE__) + "/../helper")

steps_for :users do
  Given 'a user' do
    @user = User.generate
    ActionView::Base.send :define_method, :current_user, lambda { @user }
    ActionView::Base.send :define_method, :current_user=, lambda {|u| @user = u }
  end
end
