# BrandButton

BrandButton is a Swift package that offers a customizable UIButton with compatibility for both UIKit and SwiftUI. 
This package allows you to easily integrate a stylish and branded button into your iOS applications, providing a seamless experience across UIKit and SwiftUI interfaces.

![Snapshot](Tests/BrandButtonTests/__Snapshots__/BrandButtonTests/testBrandButton_LeadingIcon.1.png)

## Features

- [x] **SwiftUI Compatibility:** Seamlessly integrate BrandButton within your SwiftUI views for a unified development experience.
- [x] **Snapshot Testing:** Ensure code stability and reliability with comprehensive snapshot testing. 
BrandButton is thoroughly tested to maintain consistent behavior and appearance across updates.
- [x] **Example Projects:** Explore the capabilities of BrandButton through example project available in both SwiftUI and UIKit. 
These project serves as valuable references for implementation and showcase the package's versatility.
- [x] **Build and Test Pipeline:** Streamline your development workflow with a robust build and test pipeline. 
The pipeline is designed to automate the process, providing efficiency and confidence in the reliability of the package.
- [x] **Fully Documented:** BrandButton comes with comprehensive documentation, generated using DocC.
This ensures that developers have access to clear and detailed information about the package,
making it easy to understand, implement, and maintain. [Documentation Link](https://pouyayarandi.github.io/BrandButton/documentation/brandbutton)

## Installation

### Swift Package Manager

Add the following package dependency to your Xcode project:

```swift
dependencies: [
    .package(url: "https://github.com/pouyayarandi/BrandButton.git", from: "1.0.0")
]
```

## Customization

Choose from a variety of predefined styles or create your own custom variant effortlessly. 
If none of the predefined styles align with your requirements, 
crafting your own variant is a straightforward process, requiring just a few lines of code.

### Available Variants

- `.bluePrimary`
- `.blueSecondary`
- `.greenPrimary`
- `.greenSecondary`
- `.custom()` (for creating your own variant)

### Animation

BrandButton effortlessly handles state transitions, including *normal*, *highlighted*, and *disabled* states, with the ability to animate these transitions. 
Simply set the updateWithAnimation property to enable this feature. 
It's important to note that animations are also supported for SwiftUI.

## Considerations

- **SwiftUI Compatible View:** Implement the SwiftUI view using `UIRepresentableView` to prevent duplicating the view implementation, improving maintainability.

- **Figma Variants:** Some variants in the Figma file, like Fab, had no design and are ignored in the implementation.

- **FullWidth Property:** Although the `fullWidth` property is implemented, it's not a recommended pattern for UIKit.
  It would be better to set constraints based on needs. However, it works fine with SwiftUI.

- **Medium Size Class Design:** Since no design was provided for the medium size class, dimensions for the medium buttons are arbitrary.

- **Font Usage:** Due to copyright restrictions on the Proxima Nova font, which is not freely available, we are unable to incorporate it into BrandButton.
  As a result, the Apple system font is used to ensure compliance with licensing constraints.

## Try It

### Build the Package:

Execute the following command to build the package effortlessly:

```
make build
```

### Run Tests:

Ensure the reliability of the package by running tests with a straightforward command:

```
make test
```

### See Example:

Open the BrandButtonExample.xcodeproj file inside Example folder using Xcode.

## Future Works

In the future, we plan to enhance BrandButton further to better accommodate accessibility needs, 
including font size adjustments and addressing other accessibility requirements. Due to time constraints, 
these improvements are currently on our roadmap, and we aim to implement them in upcoming releases. 
Your patience and understanding are appreciated as we work towards making BrandButton even more inclusive and user-friendly. 
Stay tuned for these upcoming enhancements!

