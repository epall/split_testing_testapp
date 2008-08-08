require File.dirname(__FILE__) + '/../spec_helper'
load File.dirname(__FILE__) + '/../../vendor/plugins/split_testing/Rakefile'


describe "Rake task: stripfeature" do
  before :all do
    @stripfeature_task = Rake.application.lookup :stripfeature
  end
  
  it "should exist" do
    @stripfeature_task.should_not be_nil
  end
  
  it "should strip from a view file" do
    File.open(File.dirname(__FILE__) + '/../../app/views/demo/striptest.html.erb', 'w') do |testfile|
      testfile << "<html>\n"
      testfile << "<body>\n"
      testfile << "<% feature :striptest do -%>\n"
      testfile << "Hello, world!\n"
      testfile << "<% end #feature:striptest -%>\n"
      testfile << "</body>\n</html>\n"
    end
    
    begin
      ENV['feature'] = "striptest"
      @stripfeature_task.invoke
    
      contents = ""
      File.open(File.dirname(__FILE__) + '/../../app/views/demo/striptest.html.erb', 'r') do |testfile|
        contents = testfile.read
      end
    
      contents.should include("Hello, world!")
      contents.should_not include("feature :striptest")
    ensure
      File.delete(File.dirname(__FILE__) + '/../../app/views/demo/striptest.html.erb')
    end
  end
end