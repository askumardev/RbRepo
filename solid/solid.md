Rails Perspective (Important for you)
SRP → Keep models thin, use services
OCP → Use strategy pattern / concerns
LSP → STI & inheritance carefully
ISP → Use modules instead of fat classes
DIP → Use dependency injection (e.g., services, adapters)


| Principle | Meaning                |
| --------- | ---------------------- |
| **S**     | Single responsibility  |
| **O**     | Open for extension     |
| **L**     | Replaceable subclasses |
| **I**     | Small interfaces       |
| **D**     | Depend on abstraction  |

# SOLID Principles Detailed Explanations

## Single Responsibility Principle (SRP)

**Definition:** A class should have only one reason to change, meaning it should have only one job or responsibility.

**Explanation:** This principle states that every module, class, or function in a computer program should have responsibility for a single part of that program's functionality. This makes the code more modular, easier to understand, test, and maintain. If a class has multiple responsibilities, changes to one responsibility may affect the others, leading to bugs and making the code harder to refactor.

**Example in Ruby/Rails:** Instead of having a User model that handles authentication, email sending, and data validation, separate these into User (data), UserAuthenticator, EmailService, and UserValidator classes.

## Open-Closed Principle (OCP)

**Definition:** Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.

**Explanation:** This means that you should be able to add new functionality to existing code without changing the existing code. This is achieved through abstraction and polymorphism. When requirements change, you extend the system by adding new code rather than modifying existing code, which reduces the risk of introducing bugs.

**Example in Ruby/Rails:** Use inheritance or composition to allow subclasses to override behavior. For instance, a PaymentProcessor class can be extended with different payment methods (CreditCardPayment, PayPalPayment) without modifying the base class.

## Liskov Substitution Principle (LSP)

**Definition:** Objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program.

**Explanation:** This principle ensures that inheritance is used correctly. If a class is a subclass of another, it should be able to replace the parent class without breaking the application. Violations occur when subclasses override methods in ways that change the expected behavior or throw unexpected exceptions.

**Example in Ruby/Rails:** If you have a Bird class with a fly method, a Penguin subclass shouldn't override fly to raise an exception. Instead, use composition or ensure that subclasses maintain the contract of the superclass.

## Interface Segregation Principle (ISP)

**Definition:** Clients should not be forced to depend on interfaces they do not use.

**Explanation:** This principle advises against creating large, monolithic interfaces. Instead, create smaller, more specific interfaces so that clients only need to know about the methods that are relevant to them. This leads to more flexible and maintainable code, as changes to one interface don't affect clients that don't use it.

**Example in Ruby/Rails:** In Ruby, since there are no formal interfaces, this applies to modules. Instead of a large module with many methods, create smaller modules that can be mixed in as needed. For example, separate Printable, Serializable, and Validatable modules instead of one large ObjectUtils module.

## Dependency Inversion Principle (DIP)

**Definition:** High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions.

**Explanation:** This principle promotes loose coupling between classes by ensuring that dependencies are on abstractions (interfaces or abstract classes) rather than concrete implementations. This makes the code more flexible, testable, and easier to maintain, as you can swap implementations without changing the dependent code.

**Example in Ruby/Rails:** Instead of a controller directly instantiating a database adapter, inject an abstraction (like a Repository interface) that can be implemented by different adapters (SQL, NoSQL, etc.). Use dependency injection to provide the concrete implementation at runtime.

