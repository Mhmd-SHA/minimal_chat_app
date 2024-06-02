

# Minimal Chat App

This is a minimal Android chat application that allows users to send messages to each other. The app uses Firebase Authentication and Firestore to manage user authentication and message storage.

## Features

- User authentication with email and password.
- Real-time chat functionality.
- Messages are stored in Firestore and synchronized across devices.


<p float="left">
  <img src="/img.png" width="250"  alt=""/>
  <img src="/img_1.png" width="250"  alt=""/> 
  <img src="/img_2.png" width="250"  alt=""/>
  <img src="/img_3.png" width="250"  alt=""/>
  <img src="/img_4.png" width="250"  alt=""/>
</p>


## Getting Started

1. Clone the project:
2. Open the project in Android Studio.

3. Create a Firebase project and configure it for Android using firebase Cli.

4. Add your Firebase configuration values to the `firebase_options` file in the project.

5. Build and run the project on an Android device or emulator.

## Usage

1. Create an account or sign in with an existing account.
2. Start a chat with another user.
3. Type your message and tap the send button.

## Architecture

The app uses the following architectural components:

- **Firebase Authentication:** Manages user authentication and provides secure access to the app.
- **Firestore:** Stores chat messages and synchronizes them across devices.

## Contributing

Contributions are welcome! Please read the [contributing guidelines](CONTRIBUTING.md) before submitting a pull request.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for more details.