class CreateProjectsAndAccounts < ActiveRecord::Migration
  def change
    create_table :accounts_projects do |t|
      t.belongs_to :project
      t.belongs_to :account
    end
  end
end
