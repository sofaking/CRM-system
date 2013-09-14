class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :role
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
