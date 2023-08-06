
# Craftsmen Directory App

This app allows users to search for local skilled craftsmen like carpenters, plumbers, electricians etc. Craftsmen can sign up and create a profile to market their services.

## Features

- Search for craftsmen by name, category/skills, location
- Craftsmen profiles with details like services offered, experience, portfolio etc
- Reviews and ratings for craftsmen
- User accounts to save contacts and bookmarked profiles

## Architecture

The app is built using:

- Flutter for cross-platform UI
- Firebase Auth for authentication
- Cloud Firestore for database
- Provider for state management

## Packages

**Core**

- flutter_svg: For SVG support 
- provider: State management

**UI**

- flutter_rating_bar: For ratings UI
- cached_network_image: For caching images

**Backend** 

- cloud_firestore: Firebase Firestore
- firebase_auth: Firebase authentication
- firebase_storage: For storing files
- geolocator: For location services

**Utilities**

- uuid: Generate unique IDs
- flutter_dotenv: Manage environment variables

See pubspec.yaml for complete list of packages and versions.

## Database Schema

The key tables are:

**Users**
- id
- name 
- email
- phone
- is_craftsman

**Craftsmen** 
- id
- user_id (foreign key to users table)
- bio
- services
- portfolio

**Reviews**
- id  
- craftsman_id (foreign key to craftsmen table)
- user_id (foreign key to users table)
- rating
- comment



