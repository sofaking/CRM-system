class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.belongs_to :project
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
