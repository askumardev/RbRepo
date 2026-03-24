| Feature     | Instance Variable (`@`) | Class Variable (`@@`) |
| ----------- | ----------------------- | --------------------- |
| Scope       | Per object              | Entire class          |
| Shared?     | ❌ No                   | ✅ Yes               |
| Inheritance | ❌ Not shared           | ✅ Shared            |
| Safety      | ✅ Safe                 | ⚠️ Risky             |


Instance variables are the most common way to store data in Ruby objects. They belong to a specific instance of a class.

Prefix: Starts with a single @ sign.

Scope: Only accessible inside the specific object it was created in.

Initialization: If you refer to an uninitialized instance variable, it returns nil instead of raising an error.


---------------------------------------------------

Class variables are shared across all instances of a class and the class itself. If one object changes the value, it changes for everyone.

Prefix: Starts with double @@ signs.

Scope: Shared by the class, all its instances, and all its subclasses.

Initialization: You must initialize a class variable before using it, or Ruby will raise a NameError.
