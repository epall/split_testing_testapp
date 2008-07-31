class AddRestrictionToFeature < ActiveRecord::Migration
  def self.up
    add_column :features, :restricted, :boolean, :default => false
  end

  def self.down
    remove_column :features, :restricted
  end
end
