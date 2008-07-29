require File.dirname(__FILE__) + '/../../spec_helper'

describe "/demo/split" do
  it "should show feature when enabled" do
    feature = mock("feature1")
    feature.should_receive(:enabled?).and_return(true)
    SplitTesting::Feature.stub!(:find).and_return(feature)
    
    render "/demo/split"
    
    response.should have_tag('p', 'feature 1')
  end
  it "should not show feature when disabled" do
    feature = mock("feature1")
    feature.should_receive(:enabled?).and_return(false)
    SplitTesting::Feature.stub!(:find).and_return(feature)
    
    render "/demo/split"
    
    response.should_not have_tag('p', 'feature 1')
  end
end
