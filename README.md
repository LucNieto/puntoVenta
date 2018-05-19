# README

Proyecto desarrollado para la materia de Negocios Electronicos en colaboración de:
* Tania Torres Alvarado
* Lucio Bautista Nieto
* Josue de Jesus Zapata Moreno
* Nicolas Omar Diego Hernandez

Profesor:
Uziel Trujillo Colón

Configuration
* Antes de crear la base de datos es necesario crear dentro de la carpeta config el archivo application.yml e ingresar los siguientes campos de conexion a la base de datos.
- DB_USERNAME: "tuUsuario"
- DB_PASSWORD: "tuContraseña"

- GMAIL_DOMAIN: "gmail.com"
- GMAIL_USERNAME: "tuUsuario@gmail.com"
- GMAIL_PASSWORD: "tuContraseña"

Database creation
* Para crear la base de datos ejecutamos los siguientes comandos:
1. rake db:create
2. rake db:migrate

Seeds integration
* Para ejecutar los seeds:
1. rake db:drop
2. rake db:create
3. rake db:migrate
4. rake db:seed --trace

Things you may want to cover:

* Ruby version 5.1.5

System dependencies
* Bootstrap
* jQuery
* Font-awesome
* Devise
* Figaro
* Faker
* Byebug



