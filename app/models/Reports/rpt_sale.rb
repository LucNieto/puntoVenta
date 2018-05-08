module Reports
    class RptSale
        # Validations
        include ActiveModel::Validations
        include ActiveModel::Conversion
        extend ActiveModel::Naming

        attr_accessor :year,:mes,:dia,:usuario_id,:sucursal_id

        validates :year, presence: true
        validates :mes, presence: true
        validates :dia, presence: true
        validates :usuario_id, presence: true
        validates :sucursal_id, presence: true

        def initialize(attributes = {})
        attributes.each do |name, value|
            send("#{name}=", value)
        end
        end

        def persisted?
            false # which means this object persisted in the database.
        end
    end
end