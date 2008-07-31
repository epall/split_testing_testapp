require File.expand_path(File.dirname(__FILE__) + "/helper")

steps_for :enabling do
  Given 'a page with feature \'$feat\'' do |featurename|
    @content = <<-EOF
    <p>before feature</p>
    <% feature :#{featurename} do %>
    <p>inside feature #{featurename}</p>
    <% end %>
    <p>after feature</p>
    EOF
  end

  When 'the page is rendered' do
    page_template = ActionView::Base.new
    page_template.current_user= @user
    @page = page_template.render(:inline => @content)
  end
  
  When 'the feature \'$feat\' is enabled for the user' do |featurename|
    @user.enable_tester(featurename)
  end
  
  When 'the feature \'$feat\' is disabled for the user' do |featurename|
    @user.disable_tester(featurename)
  end
  
  Then /the page should(.* )show the feature '(.*)'/ do |notshow, featurename|
    if notshow == " not "
      @page.should_not have_tag('p', "inside feature #{featurename}")
    else
      @page.should have_tag('p', "inside feature #{featurename}")
    end
  end
end

with_steps_for :enabling, :features, :users do
  run File.join(File.dirname(__FILE__), 'enabling.txt'), :type => RailsStory
end