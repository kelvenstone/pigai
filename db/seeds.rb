# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个种子会自动建立一个admin账号"

create_account = User.create([email: '53053622@qq.com', password: '123456', password_confirmation: '123456', is_admin: 'true', name: '郭凯明', school: '浙江', qq_number: '53053622', phone_number:'13386660798'])
puts "Admin account created."
