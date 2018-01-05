# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Criando Usuários teste" if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', username: 'admin', role: :superadmin, password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin2@example.com', username: 'admin2', role: :admin, password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin3@example.com', username: 'admin3', role: :user, password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "Criando blocos"
(1..6).each do |blocknumber|
	Block.create!(name: blocknumber)
end

puts "Criando torres (2 por bloco)"
towerletter = "A"
Block.all.each do |block|
	2.times do
		Tower.create!(name: towerletter, block_id: block.id)
		towerletter = towerletter.next
		towerletter = towerletter.next if towerletter == "K"
	end
end

puts "Criação dos apartamentos (14 andares, 4 apartamentos - térreo só 1 e 2)"
Tower.all.each do |tower|
	(0..14).each do |floor|
		puts "Torre #{tower.name} - Andar #{floor}"
		("01".."04").each do |number|
			Apartment.create!(name: "#{floor}#{number}" , tower_id: tower.id) unless floor == 0 and (number > "02") 
		end
	end
end

puts "Criação dos tipos de pessoas"
PersonType.create!(name: "Proprietário")
PersonType.create!(name: "Morador")
PersonType.create!(name: "Temporário")
