# CVDemo

This is a basic demo app that demonstrates the following:

- Loads and displays a (fake) CV from this endpoint: https://pastebin.com/raw/1qKFxMCZ
- Uses `Codable` for parsing JSON responses
- Uses the MVVM (Model-View-ViewModel) approach to demonstrate how view models & data sources can be unit tested
- Focuses mainly on testability and scalability (rather than design). For example, uses the "coordinator" pattern to extract navigation logic away from view controllers

# To run the app:

- Open the Xcode project file > select "CVDemo" scheme & device > Run

# To run the unit tests:

- Open the Xcode project file > select "CVDemo" scheme & device > Test

# Note the following:

- The code has been developed on Xcode 10.3 (Swift 5.0)
- No 3rd party frameworks are used for the demo. However, the "input-output" approach shown in the view models could be easily adapted to work with a reactive framework like [ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift), [RxSwift](https://github.com/ReactiveX/RxSwift) or  even [Combine](https://developer.apple.com/documentation/combine)
- The API service layer is mocked in the unit tests to return dummy CV data (i.e. so no network call is made)

# Screen shots

![Alt text](/ScreenShots/cv-demo-screenshot-sept-2019.png?raw=true "Sample CV")
