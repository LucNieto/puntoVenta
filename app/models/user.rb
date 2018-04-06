class User < ApplicationRecord
  enum user_type: [:root,:admin,:ventas]
  def nombre_usuario
    "#{nombres} #{apellido_paterno} #{apellido_materno}"
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
