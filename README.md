# ARBallApp
Experiment on Vestibular Therapy. An IOS App on spatial ball-following (based on AR).

This is an XCode project for an AR app that displays a ball in physical space and provides visual cues to help the user locate and follow the ball.

## Project Structure

The project has the following files:

- `ARBallApp/Assets.xcassets/AppIcon.appiconset/Contents.json`: JSON file that describes the contents of the app icon set.
- `ARBallApp/Base.lproj/LaunchScreen.storyboard`: Storyboard file that defines the launch screen of the app.
- `ARBallApp/Base.lproj/Main.storyboard`: Storyboard file that defines the main interface of the app.
- `ARBallApp/ViewController.swift`: Swift code file that defines the view controller for the main interface of the app. It contains a `SCNView` that displays the ball in AR and a `UILabel` that displays visual cues to help the user locate the ball.
- `ARBallApp/SceneDelegate.swift`: Swift code file that defines the scene delegate for the app. It sets up the AR session and the view controller.
- `ARBallApp/AppDelegate.swift`: Swift code file that defines the app delegate for the app. It sets up the window and the root view controller.
- `ARBallApp/Info.plist`: Property list file that contains information about the app, such as its name, version, and bundle identifier.
- `ARBallApp/Assets/ball.scn`: SceneKit scene file that defines the ball in 3D space.
- `ARBallApp/Assets/ball.png`: PNG image file that is used as the texture for the ball in the SceneKit scene.

## Usage

To use the app, simply launch it on an AR-capable device and point the camera at a flat surface. The ball will appear in physical space and move from side to side. The visual cues on-screen will help the user locate and follow the ball.

## Notes

This file is intentionally left blank.