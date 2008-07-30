require File.dirname(__FILE__) + '/../spec_helper'

describe SplitTesting::Feature do
  it "should have testers" do
    SplitTesting::Feature.new.should respond_to(:testers)
  end
end
