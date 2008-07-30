class CreateFeaturesTesters < ActiveRecord::Migration
  def self.up
    create_table :feature_testers do |t|
      t.integer :feature_id
      t.integer :tester_id
      t.boolean :enabled
    end
  end

  def self.down
    drop_table :feature_testers
  end
end
