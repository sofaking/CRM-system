# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
Role.create([ 
  {id: 1, title: "admin"},
  {id: 2, title: "visiter"},
  {id: 3, title: "client"}
])
puts "Default roles:"
puts Role.all.map(&:title)

User.delete_all
User.create(
  { id: 1, role_id: 1, email: 'admin', password: 'admin', password_confirmation: "admin" }
)
puts "Default users:"
puts User.all.map(&:email)

Todo.delete_all
Todo.create(
  { id: 1, name: 'New todo', description: 'Todo description' }
)
puts "Default todo:"
puts Todo.all.map(&:name)

TodoList.delete_all
TodoList.create(
  { id: 1, name: 'New todo list', description: 'Todo list description', todo_ids: [1] }
)
puts "Default todo_list:"
puts TodoList.all.map(&:name)

Project.delete_all
Project.create(
  { id: 1, name: 'New project', description: 'Project description', todo_list_ids: [1] }
)
puts "Default project:"
puts Project.all.map(&:name)

Account.delete_all
Account.create(
  { user_id: 1, project_ids: [1] }
)
puts "Default account:"
puts Account.all.map(&:user_id)