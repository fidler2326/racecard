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

* ...

To build and run the app:

1. Run `bundle install` to install the required gems.
2. Run `rails db:create` to create the database.
3. Run `rails db:migrate` to apply database migrations.
4. Run `bin/rails dartsass:build` to compile the SCSS files.
5. Run `rails server` to start the Rails development server.
6. Open your web browser and navigate to `http://localhost:3000` to access the application.

# TASKS

## Race ControlRace

Add the ability to execute CRUD operations on races on the Racecard control app. There should be two main views,
a "All Todays Races" view which only shows races associated with cards for the current day and races by card view,
providing the ability to view, edit, update and delete race.

Navigate to the `app/controllers/races_controller.rb` file and inspect the controller. You will need to complete the
controller methods currently marked with TODO.

You will also need to add validations to the Race model in `app/models/race.rb` and complete the view file for the
front-end
user interface in `app/views/races/*.html.erb`.

1. Complete all the request methods labeled with TODO, following the instructions provided in the comments.
2. Implement a before_action to ensure that the card is collected from the database
3. Add the validations to the Race model, outlined in the TODO comment. (`app/models/race.rb`)
4. Complete the TODO comment in the view file (`app/views/races/_edit_form.html.erb`)
5. Complete the TODO comment in the view file (`app/views/races/_form.html.erb`)
6. Complete the TODO comment in the view file (`app/views/races/_index_table.html.erb`)
7. Complete the TODO comment in the view file (`app/views/races/edit.html.erb`)
8. Complete the TODO comment in the view file (`app/views/races/index.html.erb`)
9. Complete the TODO comment in the view file (`app/views/races/new.html.erb`)
10. Complete the TODO comment in the view file (`app/views/races/show.html.erb`)

## Runner Control

Add the ability to execute CRUD operations on runners on the Racecard control app.

a "All Todays Runners" view which only shows runners associated with cards for the current day and runners by race view.

Navigate to the `app/controllers/runners_controller.rb` file and inspect the controller. You will need to complete the
controller methods currently marked with TODO.

You will also need to add validations to the Race model in `app/models/runner.rb` and complete the view file for the
front-end
user interface in `app/views/runner/*.html.erb`.

1. Complete all the request methods labeled with TODO, following the instructions provided in the comments.
2. Implement a before_action to ensure that the card is collected from the database
3. Add the validations to the Runner model, outlined in the TODO comment. (`app/models/runner.rb`)
4. Complete the TODO comment in the view files (`app/views/runners/*.html.erb`)
5. Complete bonus TODO for which require adding additional fields to the runners database table and CRUD operations.
