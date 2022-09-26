# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## All this information comes from the official ruby on rails documentation but it may also contain some of the information I came across while researching.


*File/Folder*  | *Purpose*
---------------|------------------
app/           | Contains the controllers, models, views, helpers, mailers, channels, jobs, and assets for your application. You'll focus on this folder for the remainder of this guide.
---------------|------------------
bin/           | Contains the rails script that starts your app and can contain other scripts you use to set up, update, deploy, or run your application.
---------------|-------------------
Config/        | Contains configuration for your application's routes, database, and more. This is covered in more detail in Configuring Rails Applications.
---------------|-------------------
Config.ru      | Rack configuration for Rack-based servers used to start the application. For more information about Rack, see the Rack website.
---------------|-------------------
db/            | Contains your current database schema, as well as the database migrations.
---------------|-------------------
Gemfile & Gemfile.lock        |These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem. For more information about Bundler, see the Bundler website.  |
---------------|-------------------
lib/           | Extended modules for your application.
---------------|------------------
log/           | Application log files.
---------------|------------------
public/        | Contains static files and compiled assets. When your app is running, this directory will be exposed as-is.
---------------|-----------------
Rakefile       | This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application.
---------------|-----------------
Storage        | Active Storage files for Disk Service. This is covered in Active Storage Overview.
---------------|-----------------
test/          | Unit tests, fixtures, and other test apparatus. These are covered in Testing Rails Applications.
---------------|----------------
tmp/           | Temporary files (like cache and pid files).
---------------|-----------------
vendor         | A place for all third-party code. In a typical Rails application this includes vendored gems.
---------------|-----------------
.gitarributes  | This file defines metadata for specific paths in a git repository. This metadata can be used by git and other tools to enhance their behavior. See the gitattributes documentation for more information.

# To server the application use - rails server

# Autoloading
Rails applications do not use require to load application code.

You may have noticed that ArticlesController inherits from ApplicationController, but app/controllers/articles_controller.rb does not have anything like

## require "application_controller" # DON'T DO THIS.

Application classes and modules are available everywhere, you do not need and should not load anything under app with require. This feature is called autoloading, and you can learn more about it in Autoloading and Reloading Constants.

You only need require calls for two use cases:
 - To load files under the lib directory.
 - To load gem dependencies that have require: false in the Gemfile.

# MVC and YOU
So far, we've discussed routes, controllers, actions, and views. All of these are typical pieces of a web application that follows the MVC (Model-View-Controller) pattern. MVC is a design pattern that divides the responsibilities of an application to make it easier to reason about. Rails follows this design pattern by convention.

# Model names are singular, because an instantiated model represents a single data record. To help remember this convention, think of how you would call the model's constructor: we want to write Article.new(...), not Articles.new(...). 

# Resourceful Routing
So far, we've covered the "R" (Read) of CRUD. We will eventually cover the "C" (Create), "U" (Update), and "D" (Delete). As you might have guessed, we will do so by adding new routes, controller actions, and views. Whenever we have such a combination of routes, controller actions, and views that work together to perform CRUD operations on an entity, we call that entity a resource. For example, in our application, we would say an article is a resource.

Rails provides a routes method named resources that maps all of the conventional routes for a collection of resources, such as articles. So before we proceed to the "C", "U", and "D" sections, let's replace the two get routes in config/routes.rb with resources:


# redirect_to will cause the browser to make a new request, whereas render renders the specified view for the current request. It is important to use redirect_to after mutating the database or application state. Otherwise, if the user refreshes the page, the browser will make the same request, and the mutation will be repeated.

## Strong parameters
Submitted form data is put into the params Hash, alongside captured route parameters. Thus, the create action can access the submitted title via params[:article][:title] and the submitted body via params[:article][:body]. We could pass these values individually to Article.new, but that would be verbose and possibly error-prone. And it would become worse as we add more fields.

Instead, we will pass a single Hash that contains the values. However, we must still specify what values are allowed in that Hash. Otherwise, a malicious user could potentially submit extra form fields and overwrite private data. In fact, if we pass the unfiltered params[:article] Hash directly to Article.new, Rails will raise a ForbiddenAttributesError to alert us about the problem. So we will use a feature of Rails called Strong Parameters to filter params. Think of it as strong typing for params

# validators and displaying error messages
As we have seen, creating a resource is a multi-step process. Handling invalid user input is another step of that process. Rails provides a feature called validations to help us deal with invalid user input. Validations are rules that are checked before a model object is saved. If any of the checks fail, the save will be aborted, and appropriate error messages will be added to the errors attribute of the model object.


## Updating an article
Updating a resource is very similar to creating a resource. They are both multi-step processes. First, the user requests a form to edit the data. Then, the user submits the form. If there are no errors, then the resource is updated. Else, the form is redisplayed with error messages, and the process is repeated.

These steps are conventionally handled by a controller's edit and update actions. Let's add a typical implementation of these actions to app/controllers/articles_controller.rb, below the create action:

# Using partial to share view code
Our edit form will look the same as our new form. Even the code will be the same, thanks to the Rails form builder and resourceful routing. The form builder automatically configures the form to make the appropriate kind of request, based on whether the model object has been previously saved.

## A partial's filename must be prefixed with an underscore, e.g. _form.html.erb. But when rendering, it is referenced without the underscore, e.g. render "form".


# Deleting an article
Deleting a resource is a simpler process than creating or updating. It only requires a route and a controller action. And our resourceful routing (resources :articles) already provides the route, which maps DELETE /articles/:id requests to the destroy action of ArticlesController.

The destroy action fetches the article from the database, and calls destroy on it. Then, it redirects the browser to the root path with status code