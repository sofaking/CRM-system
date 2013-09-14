# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
roles = Role.create([ 
  {id: 1, title: "admin"},
  {id: 2, title: "visiter"},
  {id: 3, title: "client"}
])
if roles[1].save or roles[2].save or roles[3].save
  puts "Default roles: " + roles.map(&:title).join(', ')
else
  puts '>>> Roles not created!'
end

User.delete_all
user = User.create(
  { id: 1, role_id: 1, email: 'admin@admin.com', password: 'admin', password_confirmation: "admin" }
)
if user.save
  puts "Default users: " + user.email
else
  puts '>>> User not created!'
end

Todo.delete_all
todo = Todo.create(
  { id: 1, name: 'New todo', description: 'Todo description' }
)
if todo.save
  puts "Default todo: " + todo.name
else
  puts '>>> Todo not created!'
end

TodoList.delete_all
todolist = TodoList.create(
  { id: 1, name: 'New todo list', description: 'Todo list description', todo_ids: [1] }
)
if todolist.save
  puts "Default todo_list: " + todolist.name
else
  puts '>>> Todo list not created!'
end

Project.delete_all
project = Project.create(
  { id: 1, name: 'New project', description: 'Project description', todo_list_ids: [1] }
)
if project.save
  puts "Default project: " + project.name
else
  puts '>>> Project list not created!'
end

Account.delete_all
account = Account.create(
  { user_id: 1, project_ids: [1] }
)
if account.save
  puts "Default account: " + account.user_id.to_s
else
  puts '>>> Account list not created!'
end