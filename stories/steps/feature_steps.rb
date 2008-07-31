require File.expand_path(File.dirname(__FILE__) + "/../helper")

steps_for :features do
  Given /a(.* )feature '$feat'/ do |restrict, featurename|
    @features ||= {}
    @features[featurename] = SplitTesting::Feature.generate(:name => featurename)
    @features[featurename].update_attribute('restricted', true) if restrict == " restricted "
  end

  When 'the feature \'$feat\' is enabled' do |featurename|
    SplitTesting::Feature.find_by_name(featurename).enable!
  end

  When 'the feature \'$feat\' is disabled' do |featurename|
    SplitTesting::Feature.find_by_name(featurename).disable!
  end
end