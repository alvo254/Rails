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