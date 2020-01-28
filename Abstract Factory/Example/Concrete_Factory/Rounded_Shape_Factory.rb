require_relative '../Abstract_Factory/Abstract_Factory'

class RoundedShapeFactory< Abstract_Factory
    def getShape(shape_type)
        if shape_type.downcase == 'rectangle'
            return RoundedRectangle.new
        elsif shape_type.downcase == "square"
            return RoundedSquare.new
        else
            return nil
        end
    end
end