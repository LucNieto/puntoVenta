# Seeds for populate database puntoventa

require 'faker'

User.create!([{
	email: 'uziel.trujillo@gmail.com',
	password: 'enviado',
	encrypted_password: '$2a$11$P1KIZGwR7Ewop418tKstMuppqED8pSeIPhd3KN/gmv4N71QIwJOvC',
	user_type: 2,
	username: 'utrujillo',
	nombres: 'Uziel',
	apellido_paterno: 'Trujillo',
	apellido_materno: 'Colon'
}])

User.create!([{
	email: 'ramo.diego12@hotmail.com',
	password: 'enviado',
	encrypted_password: '$2a$11$sJ6G8sTf/2qWe9S28tJIouRdjiy/a4gtzQ.X0UoiDnqZFLjgq8b/i',
	user_type: 1,
	username: 'nicolasdh',
	nombres: 'Nicolas Omar',
	apellido_paterno: 'Diego',
	apellido_materno: 'Hernandez'
}])

User.create!([{
	email: 'tania.torresa@hotmail.com',
	password: 'enviado',
	encrypted_password: '$2a$11$Wpy2WrnJUl8sPIR0h2yyx.gxH0X0Th29sptelabDM1CyiT0tH20z2',
	user_type: 1,
	username: 'taniatorresa',
	nombres: 'Tania',
	apellido_paterno: 'Torres',
	apellido_materno: 'Alvarado'
}])

User.create!([{
	email: 'noodle3030@gmail.com',
	password: 'enviado',
	encrypted_password: '$2a$11$MayfI9T/Nhb95H/y/aFwwOTtkHm2d.mLVN3rSuE1fu4q1V5aHlyl2',
	user_type: 1,
	username: 'Luc',
	nombres: 'Lucio',
	apellido_paterno: 'Nieto',
	apellido_materno: 'Bautista'
}])

User.create!([{
	email: 'josue.zapatamo@gmail.com',
	password: 'enviado',
	encrypted_password: '$2a$11$iNEa3IaYa0EQQ.25hOyG4OK4gtB56YiNkObVlBQyINNcgAJBGefnW',
	user_type: 1,
	username: 'RannFerii',
	nombres: 'Josue',
	apellido_paterno: 'Zapata',
	apellido_materno: 'Moreno'
}])

puts "Usuarios creados #{User.count}"

# Populating BussinessName
75.times do
	BussinesName.create!([{
		nombre: Faker::Company.name,
		rfc: Faker::Number.number(13),
		direccion_fiscal: Faker::Address.street_address
	}])
end
puts "Razon social creada #{BussinesName.count}"

# Populating Company
75.times do
	Company.create!([{
		bussines_name_id: Random.rand(1...75),
		nombre: Faker::App.name,
		direccion: Faker::Address.street_address,
	}])
end
puts "Compañias creadas #{Company.count}"

# Populating Product
prices = []
100.times do
	decimal = Faker::Number.decimal(3, 2)
	prices.push( { pcompra: decimal,  pventa: (decimal.to_f + Random.rand(5...15)).round(2) } )

	decimal = Faker::Number.decimal(2, 2)
	prices.push( { pcompra: decimal,  pventa: (decimal.to_f + Random.rand(1...5)).round(2) } )
end


100.times do
	getPrice = prices[Random.rand(0...99)]

	Product.create!([{
		company_id: Random.rand(1...75),
		nombre: Faker::Pokemon.name,
		descripcion: Faker::Pokemon.location,
		cantidad: Faker::Number.number(3),
		precio_compra: getPrice[:pcompra],
		precio_venta: getPrice[:pventa]
	}])
end

100.times do
	getPrice = prices[Random.rand(0...99)]

	Product.create!([{
		company_id: Random.rand(1...75),
		nombre: Faker::Lovecraft.deity,
		descripcion:Faker::Lorem.paragraph,
		cantidad: Faker::Number.number(3),
		precio_compra: getPrice[:pcompra],
		precio_venta: getPrice[:pventa]
	}])
end
puts "Productos #{Product.count}"


# Populating Sale
100.times do
	
	products = []
	
	# Generating products
	Random.rand(1...6).times do

		product = Product.find(Random.rand(1...200))
		cantidad = Random.rand(1...5)

		products.push({
			product_id: product.id,
			cantidad: cantidad,
			importe: cantidad * product.precio_venta
		})
	end

	# Get totals
	neto = products.map{ |p| p[:importe] }.reduce(:+)
	neto_iva = neto * 0.16
	total_compra = neto + neto_iva 

	# Generating sales
	sale = [{
		user_id: User.find([Random.rand(1...4)]).pluck(:id).first,
		company_id: Company.find([Random.rand(1...75)]).pluck(:id).first,
		neto: neto.round(2),
		neto_iva: neto_iva.round(2),
		total_compra: total_compra.round(2),
		details_attributes: products
	}]

	# Creating sale
	Sale.create!(sale)

end

puts "Ventas creadas #{Sale.count}"