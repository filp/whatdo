class AddIdeasCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :ideas_count, :integer, default: 0
  end
end
