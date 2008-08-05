require File.expand_path(File.dirname(__FILE__) + "/../helper")

steps_for :pages do
  Given /a page with feature '(.*)'/ do |featurename|
    @content = %{
    <p>before feature</p>
    <% feature :#{featurename} do %>
    <p>inside feature #{featurename}</p>
    <% end %>
    <p>after feature</p>}
  end

  When 'the page is rendered' do
    page_template = ActionView::Base.new
    page_template.current_user= @user
    @page = page_template.render(:inline => @content)
  end
  
  Then /the page should(.* )show the feature '(.*)'/ do |notshow, featurename|
    if notshow == " not "
      @page.should_not have_tag('p', "inside feature #{featurename}")
    else
      @page.should have_tag('p', "inside feature #{featurename}")
    end
  end
end