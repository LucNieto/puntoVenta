module Reports
    class RptProduct
        # Validations
        include ActiveModel::Validations
        include ActiveModel::Conversion
        extend ActiveModel::Naming

        attr_accessor :year,:mes

        validates :year, presence: true
        validates :mes, presence: true

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