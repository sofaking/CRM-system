class CreateProjectsAndAccounts < ActiveRecord::Migration
  def change
    create_table :projects_and_accounts do |t|
      t.belongs_to :project, index: true
      t.belongs_to :account, index: true
    end
  end
end
