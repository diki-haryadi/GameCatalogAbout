I'll separate the package into individual files to make it easier to understand. Here's each file of the package:

File 1: **Package.swift**
```swift
// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AboutMe",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AboutMe",
            targets: ["AboutMe"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AboutMe",
            dependencies: []),
        .testTarget(
            name: "AboutMeTests",
            dependencies: ["AboutMe"]),
    ]
)
```

File 2: **Sources/AboutMe/AboutView.swift**
```swift
import SwiftUI

public struct AboutView: View {
    // Customizable properties
    private let profileImageURL: URL?
    private let name: String
    private let role: String
    private let email: String
    private let website: String
    private let location: String
    private let navigationTitle: String
    private let backgroundColor: Color
    private let textColor: Color
    private let subtitleColor: Color
    private let accentColor: Color
    
    public init(
        profileImageURL: URL? = nil,
        name: String = "Diki Haryadi",
        role: String = "iOS Developer",
        email: String = "unpam.dik@gmail.com",
        website: String = "github.com/diki-haryadi",
        location: String = "Jakarta, Indonesia",
        navigationTitle: String = "About Developer",
        backgroundColor: Color = .white,
        textColor: Color = .white,
        subtitleColor: Color = .gray,
        accentColor: Color = .blue
    ) {
        self.profileImageURL = profileImageURL
        self.name = name
        self.role = role
        self.email = email
        self.website = website
        self.location = location
        self.navigationTitle = navigationTitle
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.subtitleColor = subtitleColor
        self.accentColor = accentColor
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: profileImageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(subtitleColor)
                @unknown default:
                    EmptyView()
                }
            }
            .padding(.horizontal)
            
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(textColor)
            
            Text(role)
                .font(.headline)
                .foregroundColor(subtitleColor)
            
            VStack(alignment: .leading, spacing: 10) {
                InfoRow(icon: "envelope.fill", text: email, accentColor: accentColor, textColor: .black)
                InfoRow(icon: "link", text: website, accentColor: accentColor, textColor: .black)
                InfoRow(icon: "location.fill", text: location, accentColor: accentColor, textColor: .black)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        .navigationTitle(navigationTitle)
    }
}
```

File 3: **Sources/AboutMe/InfoRow.swift**
```swift
import SwiftUI

struct InfoRow: View {
    let icon: String
    let text: String
    let accentColor: Color
    let textColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(accentColor)
                .frame(width: 25)
            Text(text)
                .foregroundColor(textColor)
        }
    }
}
```

File 4: **Sources/AboutMe/AboutMeView.swift**
```swift
import SwiftUI

public struct AboutMeView: View {
    // Simplified configuration struct
    public struct Configuration {
        let imageURL: URL?
        let name: String
        let role: String
        let email: String
        let website: String
        let location: String
        let darkMode: Bool
        
        public init(
            imageURL: URL? = nil,
            name: String = "Diki Haryadi",
            role: String = "iOS Developer",
            email: String = "unpam.dik@gmail.com",
            website: String = "github.com/diki-haryadi",
            location: String = "Jakarta, Indonesia",
            darkMode: Bool = false
        ) {
            self.imageURL = imageURL
            self.name = name
            self.role = role
            self.email = email
            self.website = website
            self.location = location
            self.darkMode = darkMode
        }
    }
    
    private let config: Configuration
    
    public init(config: Configuration = Configuration()) {
        self.config = config
    }
    
    public var body: some View {
        NavigationView {
            AboutView(
                profileImageURL: config.imageURL,
                name: config.name,
                role: config.role,
                email: config.email,
                website: config.website,
                location: config.location,
                backgroundColor: config.darkMode ? .black : .white,
                textColor: config.darkMode ? .white : .black,
                subtitleColor: .gray,
                accentColor: .blue
            )
        }
        .preferredColorScheme(config.darkMode ? .dark : .light)
    }
}
```

File 5: **README.md**
```markdown
# AboutMe Swift Package

A simple, customizable "About Me" view that can be easily integrated into any iOS app.

## Features

- Displays profile information with a clean UI
- Fully customizable content and styling
- Built with SwiftUI for iOS 15+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/AboutMe.git", from: "1.0.0")
]
```

Or add it directly through Xcode:
1. File > Swift Packages > Add Package Dependency
2. Enter package URL: `https://github.com/yourusername/AboutMe.git`

## Usage

### Basic Usage

```swift
import AboutMe
import SwiftUI

struct ContentView: View {
    var body: some View {
        AboutMeView()
    }
}
```

### Customized Usage

```swift
import AboutMe
import SwiftUI

struct ContentView: View {
    var body: some View {
        AboutMeView(config: .init(
            imageURL: URL(string: "https://example.com/profile.jpg"),
            name: "Your Name",
            role: "Your Role",
            email: "your.email@example.com",
            website: "github.com/yourusername",
            location: "Your Location",
            darkMode: true
        ))
    }
}
```

### Advanced Customization

For more advanced customization, you can use the `AboutView` directly:

```swift
import AboutMe
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            AboutView(
                profileImageURL: URL(string: "https://example.com/profile.jpg"),
                name: "Your Name",
                role: "Your Role",
                email: "your.email@example.com",
                website: "github.com/yourusername",
                location: "Your Location",
                navigationTitle: "Custom Title",
                backgroundColor: .blue,
                textColor: .white,
                subtitleColor: .yellow,
                accentColor: .green
            )
        }
    }
}
```

## License

MIT License
```
