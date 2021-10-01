require './connect_db.rb'
connect_db!
ActiveRecord::Migration.create_table(:users) do |u|
  u.column:user_name,:text
  u.column:user_email,:text
  u.column:user_password,:text
end
