# Convention over configuration is a software design paradigm which seeks to decrease the number of decisions that developers need to make, gaining simplicity,
#  and not necessarily losing flexibility.
# The phrase essentially means a developer only needs to specify unconventional aspects of the application. 
# For example, if there is a class Sales in the model, the corresponding table in the database is called "sales" by default. 
# It is only if one deviates from this convention, such as calling the table "product sales", that one needs to write code regarding these names.


Convention over Configuration is a core principle of Ruby on Rails, meaning that the framework provides sensible defaults for project structure and behavior, 
allowing developers to focus on writing application logic instead of configuring settings. Rails is designed with conventions that follow widely accepted
 best practices, reducing the need for boilerplate code and detailed configuration files.

Key aspects of Convention over Configuration in Rails:
Directory Structure: Rails assumes a specific project layout (like app/models, app/controllers, etc.). If you follow this convention, 
you don't need to specify where your models, views, or controllers are located.

Naming Conventions:
  Models are singular and capitalized (User), while corresponding database tables are plural (users).
  Controllers are named plural (e.g., UsersController) and should contain actions like index, show, new, create, edit, update, and destroy.
  Associations such as belongs_to and has_many automatically infer foreign keys and join tables based on names.

RESTful Routes: Rails uses RESTful routing conventions where HTTP methods like GET, POST, PUT, and DELETE map to specific controller actions.

Database Migrations: Migrations follow a convention for defining schema changes, and Rails automatically names columns and indexes 
(e.g., using id for primary keys and {table_name}_id for foreign keys).

Asset Pipeline: Rails expects JavaScript, CSS, and image files to be organized in the app/assets, lib/assets, or vendor/assets folders.