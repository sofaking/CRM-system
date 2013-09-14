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
if roles.map(&:save)
  puts "Default roles: " + roles.map(&:title).join(', ')
else
  puts '>>> Roles not created!'
end

User.delete_all
users = User.create([
  { id: 1, role_id: 1, email: 'admin@admin.com',     password: 'admin',   password_confirmation: 'admin' },
  { id: 2, role_id: 2, email: 'visiter@visiter.com', password: 'visiter', password_confirmation: 'visiter' },
  { id: 3, role_id: 3, email: 'client@client.com',   password: 'client',  password_confirmation: 'client' }
])
if users.map(&:save)
  puts "Default users: " + users.map(&:email).join(', ')
else
  puts '>>> User not created!'
end

Todo.delete_all
todos = Todo.create([
  { id: 1, name: 'New todo', description: 'Todo description' },
  { id: 2, name: 'New todo', description: 'Todo description' }
])
if todos.map(&:save)
  puts "Default todo: " + todos.map(&:name).join(', ')
else
  puts '>>> Todo not created!'
end

TodoList.delete_all
todolists = TodoList.create([
  { id: 1, name: 'New todo list', description: 'Todo list description', todo_ids: [1] },
  { id: 2, name: 'New todo list', description: 'Todo list description', todo_ids: [2] }
])
if todolists.map(&:save)
  puts "Default todo_list: " + todolists.map(&:name).join(', ')
else
  puts '>>> Todo list not created!'
end

Project.delete_all
projects = Project.create([
  { id: 1, name: 'New project', description: 'Project description', todo_list_ids: [1] },
  { id: 2, name: 'New project', description: 'Project description', todo_list_ids: [2] }
])
if projects.map(&:save)
  puts "Default project: " + projects.map(&:name).join(', ')
else
  puts '>>> Project list not created!'
end

Account.delete_all
accounts = Account.create([
  { id: 1, user_id: 1, project_ids: [1] },
  { id: 2, user_id: 2, project_ids: [2] },
  { id: 3, user_id: 3, project_ids: [2] }
])
if accounts.map(&:save)
  puts "Default account: " + accounts.map(&:user_id).map(&:to_s).join(', ')
else
  puts '>>> Account list not created!'
end