# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.create([{
	email: 'uziel.trujillo@gmail.com',
	encrypted_password: '$2a$11$P1KIZGwR7Ewop418tKstMuppqED8pSeIPhd3KN/gmv4N71QIwJOvC',
	user_type: 2,
	username: 'utrujillo',
	nombres: 'Uziel',
	apellido_paterno: 'Trujillo',
	apellido_materno: 'Colon'
}])

User.create([{
	email: 'ramo.diego12@hotmail.com',
	encrypted_password: '$2a$11$sJ6G8sTf/2qWe9S28tJIouRdjiy/a4gtzQ.X0UoiDnqZFLjgq8b/i',
	user_type: 1,
	username: 'nicolasdh',
	nombres: 'Nicolas Omar',
	apellido_paterno: 'Diego',
	apellido_materno: 'Hernandez'
}])

User.create([{
	email: 'tania.torresa@hotmail.com',
	encrypted_password: '$2a$11$Wpy2WrnJUl8sPIR0h2yyx.gxH0X0Th29sptelabDM1CyiT0tH20z2',
	user_type: 1,
	username: 'taniatorresa',
	nombres: 'Tania',
	apellido_paterno: 'Torres',
	apellido_materno: 'Alvarado'
}])

User.create([{
	email: 'noodle3030@gmail.com',
	encrypted_password: '$2a$11$MayfI9T/Nhb95H/y/aFwwOTtkHm2d.mLVN3rSuE1fu4q1V5aHlyl2',
	user_type: 1,
	username: 'Luc',
	nombres: 'Lucio',
	apellido_paterno: 'Nieto',
	apellido_materno: 'Bautista'
}])

#Ingresar aqui usuario de Josue y descomentar
#User.create([{
#	email: '',
#	encrypted_password: '',
#	user_type: 1,
#	username: '',
#	nombres: '',
#	apellido_paterno: '',
#	apellido_materno: ''
#}])

75.times do
	BussinesName.create([{
		nombre: Faker::Company.name,
		rfc: Faker::Number.number(13),
		direccion_fiscal: Faker::Address.street_address
	}])
end

20.times do
	Company.create([{
		bussines_name_id: Faker::Number.digit,
		nombre: Faker::Lovecraft.deity,
		direccion: Faker::Lovecraft.location,
	}])
end

100.times do
	Company.create([{
		bussines_name_id: Faker::Number.number(2),
		nombre: Faker::Lovecraft.deity,
		direccion: Faker::Lovecraft.location,
	}])
end

20.times do
	Product.create([{
		company_id: Faker::Number.digit,
		nombre: Faker::Pokemon.name,
		descripcion: Faker::Lorem.paragraph,
		cantidad: Faker::Number.number(2),
		precio_compra: Faker::Number.decimal(2, 2),
		precio_venta: Faker::Number.decimal(2, 2)
	}])
end

100.times do
	Product.create([{
		company_id: Faker::Number.number(2),
		nombre: Faker::Lovecraft.deity,
		descripcion:Faker::Lorem.paragraph,
		cantidad: Faker::Number.number(2),
		precio_compra: Faker::Number.decimal(2, 2),
		precio_venta: Faker::Number.decimal(2, 2)
	}])
end