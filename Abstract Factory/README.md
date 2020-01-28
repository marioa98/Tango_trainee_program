# Abstract Factory

**Category:** Creational

**Intent:** Provide an interface for creating families of related or dependent objects without specifying their concrete classes.

## Applications

Use the Abstract Factory pattern when:

- A system should be independent of how its product are created, composed and represented.
- A system should be configured with one of multiples families of products.
- A family of related product objects is designed to be used together, and you need to enforce this constraint.
- You want to provide a class library of products, and you want to reveal just their interfaces, not their implementations.

## Structure

![alt text](Abstract_Factory.png)

## Participants

- **AbstractFactory:** Declares an interface for operation that create abstract product objects.
- **ConcreteFactory:** Implements the operation to create concrete product objects.
- **AbstractProduct:** Declares an interface for a type of product objects.
- **ConcreteProduct:** Defines a product object to be created by the corresponding concrete factory.
- **Client:** Uses only interfaces declared by AbstractFactory and AbstractProdcut.