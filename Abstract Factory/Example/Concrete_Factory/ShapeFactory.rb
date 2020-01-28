require_relative '../Abstract_Factory/AbstractFactory'
require_relative '../Concrete_Classes/Rectangle'
require_relative '../Concrete_Classes/RoundedRectangle'
require_relative '../Concrete_Classes/RoundedSquare'

class ShapeFactory < AbstractFactory
    def getShape(shape_type)
        if shape_type.downcase == 'rectangle'
            return Rectangle.new
        elsif shape_type.downcase == "rounded square"
            return RoundedSquare.new
        elsif shape_type.downcase == "rounded rectangle"
            return RoundedRectangle.new
        else
            return nil
        end
    end
end