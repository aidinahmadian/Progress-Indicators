# Progress-Indicators

Creating Loading/Downloading/Error Indicators, Programmatically without Storyboard Using Swift 5.0+
Progress-Indicators is written in Swift 5.0+. It can be built by Xcode 14.0 or later. Compatible with iOS 16.0+.

### Photos Sample

<img width="300" alt="gif" src="Pics/gif.gif"> <img width="300" alt="firstpic" src="Pics/firstpic.png">
<img width="300" alt="secondpic" src="Pics/secondpic.png"> <img width="300" alt="thirdpic" src="Pics/thirdpic.png">

## Features

- **Customizable Loading Indicators**: Create and customize loading indicators to fit the design of your application.
- **Download Progress Indicators**: Show progress bars or other indicators to represent download status.
- **Error Indicators**: Display error messages or icons when an operation fails.
- **Support for Swift 5.0+**: Built with the latest version of Swift for compatibility and performance.
- **Programmatic UI**: All indicators can be created and managed programmatically, providing flexibility and control.

## Requirements

- **iOS 16.0+** or **macOS 13.0+**
- **Xcode 14.0+**
- **Swift 5.0+**

## Installation

To integrate Progress-Indicators into your Xcode project, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/aidinahmadian/Progress-Indicators
   ```

2. **Open the project**:
   Navigate to the project directory and open `Progress Indicators.xcodeproj` in Xcode.

3. **Build the project**:
   Build and run the project to see the indicators in action.

## Usage

To use the indicators in your project, include the necessary Swift files and use the provided methods to display the indicators. Below is a basic example of how to create and display a loading indicator:

```swift
import ProgressIndicators

let loadingIndicator = LoadingIndicator()
loadingIndicator.show()
```

For detailed usage and advanced customization, you can refer to [JGProgressHUD](https://github.com/JonasGessner/JGProgressHUD) as a similar library with extensive documentation and examples.

### Customization

You can customize the appearance and behavior of the indicators by modifying their properties. For example:

```swift
loadingIndicator.color = .blue
loadingIndicator.size = CGSize(width: 50, height: 50)
```

## Contribution

Contributions are welcome! To contribute:

1. **Fork the repository**.
2. **Create a new branch** for your feature or bugfix.
3. **Submit a pull request** with a detailed description of your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

Created by Aidin. For more information, visit [my GitHub profile](https://github.com/aidinahmadian).

---

Feel free to reach out with any questions or feedback!
