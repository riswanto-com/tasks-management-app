
## About Laravel
<p>Laravel Version : Laravel 11 + Vue 3 with Inertia JS</p>
<p>PHP Version on my computer : PHP 8.2.0</p>
<p>Database : MySQL</p>

## How to Build the Tasks Management App:
1. run the command at the command prompt : composer require "ext-gd:*" --ignore-platform-reqs
2. Run the command at the command prompt: npm install
3. Database settings in the create .env file then enter the database connection config in the following section: 

     DB_CONNECTION=mysql
     DB_HOST=127.0.0.1
     DB_PORT=3306
     DB_DATABASE=task_management
     DB_USERNAME=root
     DB_PASSWORD=

4. Run the command at the command prompt: php artisan migrate to migrate the database
5. Run the command at the command prompt: npm run dev, then php artisan serve. The application is ready to use.
