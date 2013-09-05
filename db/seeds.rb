# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create(
  { id: 1, email: 'admin', password: 'admin', password_confirmation: "admin" }
)
puts "Default users:"
puts User.all.map(&:email)

Todo.delete_all
Todo.create(
  { name: 'New todo', description: 'Todo description' }
)
puts "Default todo:"
puts Todo.all.map(&:name)

TodoList.delete_all
TodoList.create(
  { name: 'New todo list', description: 'Todo list description', todo_ids: Todo.last.id }
)
puts "Default todo_list:"
puts TodoList.all.map(&:name)

Project.delete_all
Project.create(
  { name: 'New project', description: 'Project description', todo_list_ids: TodoList.last.id }
)
puts "Default project:"
puts Project.all.map(&:name)

Account.delete_all
Account.create(
  { user_id: User.last.id, project__ids: Project.last.id }
)
puts "Default account:"
puts Account.all.map(&:user_id)