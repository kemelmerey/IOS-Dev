Xylophone App

Developer

Kemel Merey

Overview

The Xylophone app is a simple musical app that simulates a xylophone using UIKit. It displays a series of colored buttons, each representing a musical note. When a button is tapped, the app plays the corresponding note using AVFoundation.

Features
Seven Buttons: Each button represents a different musical note (C, D, E, F, G, A, B).
Distinct Colors: Each button has a unique color for easy identification.
Sound Playback: When a button is tapped, the corresponding note is played immediately.
Visual Feedback (Bonus): Buttons give visual feedback when pressed by temporarily changing their opacity or scale.
Responsive Layout: The app uses Auto Layout to ensure it displays correctly on all iPhone screen sizes.
Requirements

Xcode: Version 12.0 or later
iOS Deployment Target: iOS 13.0 or later
Swift Version: 5.0 or later
Instructions to Build and Run

Clone the repository to your local machine:
bash
Copy code
git clone <repository-url>
Open the project in Xcode by double-clicking the Xylophone.xcodeproj file.
Build and run the app:
Select the target device (iPhone Simulator or a physical device).
Press the Run button (Cmd + R) in Xcode.
Once the app runs on the simulator or your device, you should see seven colored buttons arranged vertically. Tapping any button will play a note corresponding to that button's title.
Optional Features Implemented

Visual Feedback: Buttons change their appearance when tapped to provide immediate feedback to the user.
Notes

The app was developed using UIKit and AVFoundation without any third-party libraries.
All sound files (.wav files for each musical note) are included in the app’s bundle.