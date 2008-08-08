require File.dirname(__FILE__) + '/../spec_helper'

describe FeatureStripper do
  before :all do
    @simple_doc = <<-EOF
    this is before the feature
    <% feature :foo do -%>
      inside feature
    <% end #feature:foo %>
    EOF
  end
  
  it "should strip easy feature blocks" do
    FeatureStripper.strip(@simple_doc, 'foo').should_not include("feature :foo do")
    FeatureStripper.strip(@simple_doc, 'foo').should_not include("<% end %>")
    FeatureStripper.strip(@simple_doc, 'foo').should include("inside feature")
  end
  
  it "should be unhappy if it can't find the end of the feature" do
    broken_doc = <<-EOF
    this is before the feature
    <% feature :foo do -%>
      inside feature
    <% end #feature:fooz %>
    EOF
    
    lambda {FeatureStripper.strip(broken_doc, 'foo')}.should raise_error
    
  end
end