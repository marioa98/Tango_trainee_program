# Main file which the demo going to compile

require_relative 'FactoryProducer'

# Inherits from the FactoryProducer class
class Demo < FactoryProducer

    def main
        shape_factory = FactoryProducer.new
        shape1 = shape_factory.getShape("rectangle")
        puts shape1.draw

        shape2 = shape_factory.getShape("rounded square")
        puts shape2.draw

        shape3 = shape_factory.getShape("rounded rectangle")
        puts shape3.draw
    end
end

demo = Demo.new
demo.main