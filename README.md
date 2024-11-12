# Aries: Minimalistic Journaling App

Aries is a sleek and intuitive journaling app built using Flutter and Firebase, designed to provide a smooth, clutter-free journaling experience. Whether you're capturing daily reflections, emotions, or memories, Aries offers a safe and easy platform to record your thoughts in a minimalist environment.

## Description

Aries is a mobile journaling application that combines simplicity with powerful features, built using Flutter for the frontend and Firebase for backend services. With Aries, users can quickly write and organize their thoughts, track moods, and stay motivated with streaks and reminders. It features a clean interface, secure cloud storage, Markdown support for rich formatting, and analytics to help users reflect on their journaling habits over time.

Whether you're new to journaling or a seasoned writer, Aries is designed to seamlessly integrate into your daily routine and help you maintain consistency.

## Features

- **Clean and Intuitive Interface**: A simple, elegant design that keeps distractions to a minimum while providing all the tools you need to journal effectively.
- **Secure Cloud Storage**: Powered by Firebase, your journal entries are safely stored in the cloud and can be accessed from any device.
- **Markdown Support**: Format your journal entries using Markdown for clean, readable text with headings, bullet points, bold/italics, and more.
- **Search Functionality**: Easily search and filter through your journal entries using a built-in calendar page.
- **Daily Reminders**: Stay motivated with customizable daily reminders to help you stay on track with your journaling habit.
- **Mood Analytics**: Visualize trends in your mood over time, including streaks and emotional patterns based on your journal entries.

## Getting Started

### Dependencies

Before installing Aries, ensure that your system meets the following requirements:

- **Flutter**: Version 3.0 or higher
- **Firebase**: Set up a Firebase project for cloud storage and authentication
- **Android Studio/Xcode**: For running and testing on Android/iOS simulators
- **Operating System**: macOS, Windows, or Linux

### Installing

1. **Clone the repository**: 
```
git clone https://github.com/Patle1234/Aries.git
```
3. **Navigate to the project folder**:
```
    cd Aries
  ```

4. **Install dependencies**:
Ensure that Flutter is installed on your system and then run:
```
    flutter pub get
  ```

5. **Set up Firebase**:
- Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
- Add your Android/iOS app to the Firebase project.
- Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place it in the respective project directory.
- Enable Firebase Authentication (for login functionality) and Firebase Firestore (for storing journal entries).

5. **Configure the Firebase SDK**:
Follow the Firebase documentation to integrate the SDK into your Flutter project:
- [FlutterFire setup documentation](https://firebase.flutter.dev/docs/overview)

6. **Run the app**:
After setting up Firebase, run the app in your preferred simulator/emulator:


### Executing the Program

Once the setup is complete, you can start using the Aries app on your device. Here are the steps:

1. Open the app on your device or simulator.
2. **Sign in** using your preferred method (email/password or Google Sign-In).
3. Start journaling! Write your thoughts, add emotions, and format your entries using Markdown.
4. Access analytics to track your mood and journaling streaks over time.

## Help

### Common Issues

- **Issue**: "Firebase authentication fails during sign-in."
- **Solution**: Ensure that your Firebase project is properly configured with the correct OAuth provider (e.g., email/password or Google Sign-In) and that the `google-services.json`/`GoogleService-Info.plist` file is correctly placed in the project directory.

- **Issue**: "App crashes on launch."
- **Solution**: Check your Flutter environment and ensure that all dependencies are up-to-date by running:
 ```
 flutter doctor
 ```

- **Issue**: "Analytics are not showing."
- **Solution**: Verify that Firebase Firestore is properly configured, and ensure that the app has the necessary permissions to read from Firestore.

### Helpful Commands

To diagnose issues or get more help with the setup, run:


This command will check your Flutter installation and report any missing dependencies or configuration issues.
```
    flutter doctor
  ```
## Authors

- **Patle1234** – Creator and Lead Developer  
  - [GitHub](https://github.com/Patle1234)  
  - [Twitter](https://twitter.com/Patle1234)

## Version History

- **0.2**
  - Added mood analytics and streak tracking
  - Bug fixes and UI improvements
  - See [commit change](https://github.com/Patle1234/Aries/commits) for more details
- **0.1**
  - Initial Release with core journaling functionality

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the LICENSE.md file for details.

## Acknowledgments

- **Inspiration**: The idea for Aries was inspired by a need for a simple yet powerful journaling tool.
- **Libraries Used**:
  - [Flutter](https://flutter.dev/) - Framework for building natively compiled applications.
  - [Firebase](https://firebase.google.com/) - Backend services for cloud storage and authentication.
- Special thanks to [awesome-readme](https://github.com/matiassingers/awesome-readme) for the inspiration in writing great documentation.







![Simulator Screenshot - ARIES TEST PHONE - 2023-05-16 at 09 29 56](https://github.com/Patle1234/Aries/assets/63603475/05a3f413-1dc1-4d53-9649-fff6aa8fd8d4)
![Simulator Screenshot - ARIES TEST PHONE - 2023-05-16 at 04 52 13](https://github.com/Patle1234/Aries/assets/63603475/14934a83-be63-4fdb-809d-ea3b5c0bd487)
