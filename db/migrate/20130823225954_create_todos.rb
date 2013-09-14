class CreateTodos < ActiveRecord::Migration
  create_table :todos do |t|
    t.belongs_to :todo_list
    t.string :name
    t.string :description
    t.boolean :done
    t.datetime :datetime

    t.timestamps
  end
end
