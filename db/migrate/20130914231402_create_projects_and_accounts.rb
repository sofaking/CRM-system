class CreateProjectsAndAccounts < ActiveRecord::Migration
  def change
    create_table :projects_accounts do |t|
      t.belongs_to :project
      t.belongs_to :account
    end
  end
end
