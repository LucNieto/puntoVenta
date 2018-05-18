module Reports
    class RptProduct
        # Validations
        include ActiveModel::Validations
        include ActiveModel::Conversion
        extend ActiveModel::Naming

        attr_accessor :year,:mes,:dia,:sucursal_id

        validates :year, presence: true
        validates :mes, presence: true
        validates :dia, presence: true
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
    def self.to_csv(options ={})
        CSV.generate (options) do |csv|
          csv << column_names
          all.each do |product|
            csv <<product.attributes.values_at(*column_names)
          end
        end
      end
end