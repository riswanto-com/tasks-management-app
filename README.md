<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a>
<a href="https://vuejs.org" target="_blank"><img src="https://www.vectorlogo.zone/logos/vuejs/vuejs-icon.svg" width="60" alt="Vue Logo"></a>
</p>
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
