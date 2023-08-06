# Craftsmen Directory App

This app allows users to search for skilled craftsmen like plumbers, carpenters, electricians etc. Craftsmen can create a profile to advertise their services.

## Key Features

- Search and filter craftsmen by name, skills, and location
- Craftsmen profiles with contact info, bio, services, and portfolio
- User reviews and ratings for craftsmen
- User accounts to save favorites and appointments

## Architecture

The app is built with:

- Flutter for cross-platform UI
- SQFlite local database 
- Repository pattern for separation of concerns
- Provider for state management

## Models

Key data models include:

- **User** - Regular app users
- **Craftsman** - Craftsmen profiles
- **Review** - Ratings/reviews left for craftsmen 
- **ServiceCategory** - Categories of services offered

## Database

The local SQFlite database has tables for:

- users
- craftsmen
- reviews
- service_categories

Foreign keys are used to link related data.

## App Flow

Some core user flows:

- Search/filter craftsmen
- View craftsman profile details
- Register as a craftsman
- Leave reviews for craftsmen
- Save/favorite craftsmen

## Getting Started

To run the app locally:

1. Clone the repository
2. Run `flutter pub get`
3. Launch emulator and run `flutter run`

## Contributing

Contributions are welcome! Please open an issue or PR.

