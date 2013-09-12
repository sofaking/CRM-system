class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :account
      t.belongs_to :project
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day

      t.timestamps
    end
  end
end
