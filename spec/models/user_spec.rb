require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before(:each) do
    @user = User.generate
  end

  it "should be valid" do
    @user.should be_valid
  end
  
  it "should be able to enable testing of a feature" do
    feat = SplitTesting::Feature.generate(:name => 'foo')
    @user.enable_tester('foo')
    
    SplitTesting::FeatureTester.find(:first, :conditions => {:feature_id => feat.id, :tester_id => @user.id}).should be_enabled
  end

  it "should be able to disable testing of a feature" do
    feat = SplitTesting::Feature.generate(:name => 'foo')
    @user.disable_tester('foo')
    
    SplitTesting::FeatureTester.find(:first, :conditions => {:feature_id => feat.id, :tester_id => @user.id}).should_not be_enabled
  end
end
