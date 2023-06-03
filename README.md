# College Management App with Course Recommendation

This repository contains the code and documentation for a College Management App developed using Flutter, Firebase Authentication, and Recommendation using Matrix Factorization and Collaborative Filtering.

## Overview

The College Management App is designed to simplify and streamline various administrative tasks within a college or university. It provides a user-friendly interface for students, faculty, and administrators to manage their academic and administrative activities. Additionally, the app incorporates a course recommendation system to assist students in selecting courses based on their interests and academic history.

## Features

1. User Authentication: The app utilizes Firebase Authentication to securely manage user registration and login. Users can create accounts using their email addresses and passwords or authenticate through third-party providers like Google and Facebook.

2. Student Dashboard: The app offers a personalized dashboard for students where they can access their course schedules, grades, attendance records, and other academic information. Students can also track their progress towards completing degree requirements.

3. Course Registration: Students can browse and search for available courses, view course details, and register for courses directly through the app. The course registration process ensures that students meet the prerequisites and available seats are allocated fairly.

4. Faculty Management: The app allows faculty members to view their teaching schedules, manage student grades, record attendance, and communicate with students through announcements and messages.

5. Administrative Tools: College administrators have access to administrative tools that enable them to manage faculty, track student progress, generate reports, and perform other administrative tasks efficiently.

6. Course Recommendation: The app incorporates a course recommendation system based on Matrix Factorization and Collaborative Filtering techniques. By analyzing the course history and preferences of individual students, the recommendation system suggests relevant courses that align with their interests and academic goals.

7. Push Notifications: The app supports push notifications to keep users informed about important updates, such as registration deadlines, course changes, and announcements.

## Installation

To run the College Management App locally, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/college-management-app.git`
2. Navigate to the project directory: `cd college-management-app`
3. Install dependencies: `flutter pub get`
4. Set up Firebase project and enable authentication and Firestore database.
5. Add your Firebase configuration files to the project.
6. Run the app: `flutter run`

Note: Make sure you have Flutter and Dart SDK installed on your machine before running the app.

## Technologies Used

- Flutter: A cross-platform UI framework for building natively compiled applications for mobile, web, and desktop from a single codebase.
- Firebase Authentication: A service provided by Google that simplifies the authentication process, allowing users to sign in with different providers or directly with email and password.
- Firebase Firestore: A NoSQL document database provided by Firebase to store and sync app data in real-time.
- Matrix Factorization: A collaborative filtering technique used to analyze patterns in user-item interactions to make personalized recommendations.
- Collaborative Filtering: A technique that predicts user preferences by collecting preferences from many users.


## License

Feel free to use and modify the code as per your requirements.

## Acknowledgements

We would like to acknowledge the following resources and libraries that contributed to the development of this project:

- Flutter: https://flutter.dev/
- Firebase: https://firebase.google.com/
- Matrix Factorization: [Matrix Factorization Techniques for Recommender Systems](https://datajobs.com/data-science-repo/Recommender-Systems-%5BNetflix
