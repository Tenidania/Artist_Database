French Learning Database

Before starting, ensure you have the following installed on your system:
   Python 3.8+ (for the Django backend)
   MySQL (for the database)
   pip (Python package manager)

Setup Instructions

1. Set Up the MySQL DATABASE
       mysql -u root -p
       CREATE DATABASE artist_database;
       Return to terminal
       mysql -u root -p artist_database < artist_dump.sql

2. Set Up the Django Project
     pip install -r ./requirements.txt


4. Run the Project
     cd ./artist_site
     python manage.py runserver

5. Use application
     Go to 127.0.0.1:8000/ in order to use the application

NOTE: superuser is "teni" password is "password"
