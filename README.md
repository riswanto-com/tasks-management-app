
## About Laravel

<p>Laravel Version : Laravel 11 + Vue 3 with Inertia JS</p>
<p>PHP Version on my computer : PHP 8.2.0</p>
<p>Database : MySQL</p>
# How to Build the Tasks Management App:
1. run the command at the command prompt : composer require "ext-gd:*" --ignore-platform-reqs
2. Run the command at the command prompt: npm install
3. Database settings in the create .env file then enter the database connection config in the following section: 

     <p>DB_CONNECTION=mysql</p>
     <p>DB_HOST=127.0.0.1</p>
     <p>DB_PORT=3306</p>
     <p>DB_DATABASE=task_management</p>
     <p>DB_USERNAME=root</p>
     <p>DB_PASSWORD=</p>

4. Run the command at the command prompt: php artisan migrate to migrate the database
5. Run the command at the command prompt: npm run dev, then php artisan serve. The application is ready to use.
