class AddProjectCountToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :project_count, :integer
  end
end
