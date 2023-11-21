<div align="center">

# MapSwifty

SwiftUI component simplifying map integration using MapKit.

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
![iOS](https://img.shields.io/badge/iOS-13.0%2B-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

`MapSwifty` makes it easy to display maps with annotations, customize appearance, and track user location.

</div>

# MapSwifty

`SwiftyMap` is a SwiftUI component that provides a customizable map view using `MapKit`. It allows you to easily integrate maps into your SwiftUI app with support for annotations.

## Features

- Display a map with specified annotations.
- Customize map appearance and behavior.
- Support for user location tracking.
- Specify min and max zoom levels.

## Usage

To use `SwiftyMap` in your SwiftUI project, follow these steps:

### Installation

Add the following Swift package dependency to your Xcode project:

```swift
.package(url: "https://github.com/your-username/SwiftyMap.git")
```

### Import

Import the `SwiftyMap` module in your SwiftUI view:

```swift
import SwiftyMap
```

### Initialization

Create an array of `CLLocationCoordinate2D` objects to represent map annotations. Then, use the `MapSwifty` view in your SwiftUI hierarchy:


``` 
import SwiftUI
import SwiftyMap

struct ContentView: View {
    @State private var userLocation: CLLocationCoordinate2D? = nil

    var body: some View {
        MapSwifty(
            userLocation: $userLocation,
            minZoom: 1000,
            maxZoom: 50000,
            userTrackingMode: .follow,
            showsUserLocation: true,
            isRotateEnabled: true,
            mapType: .standard,
            annotationItems: [
                CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)
            ]
        )
        .frame(height: 300)
    }
}



```

### Customization

- **User Location**: You can track the user's location by binding the `userLocation` property.
- **Zoom Levels**: Set the `minZoom` and `maxZoom` properties to specify the minimum and maximum zoom levels.
- **User Tracking**: Customize the user tracking mode with the `userTrackingMode` property.
- **Rotation**: Enable or disable map rotation using the `isRotateEnabled` property.
- **Map Type**: Choose the map type (standard, satellite, hybrid) with the `mapType` property.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.mb) file for details.
- **User Location**: You can track the user's location by binding the `userLocation` property.
- **Zoom Levels**: Set the `minZoom` and `maxZoom` properties to specify the minimum and maximum zoom levels.
- **User Tracking**: Customize the user tracking mode with the `userTrackingMode` property.
- **Rotation**: Enable or disable map rotation using the `isRotateEnabled` property.
- **Map Type**: Choose the map type (standard, satellite, hybrid) with the `mapType` property.
