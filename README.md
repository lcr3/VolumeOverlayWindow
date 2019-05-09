# VolumeOverlayWindow

[![CI Status](https://img.shields.io/travis/okanoryo/VolumeOverlayWindow.svg?style=flat)](https://travis-ci.org/okanoryo/VolumeOverlayWindow)
[![Version](https://img.shields.io/cocoapods/v/VolumeOverlayWindow.svg?style=flat)](https://cocoapods.org/pods/VolumeOverlayWindow)
[![License](https://img.shields.io/cocoapods/l/VolumeOverlayWindow.svg?style=flat)](https://cocoapods.org/pods/VolumeOverlayWindow)
[![Platform](https://img.shields.io/cocoapods/p/VolumeOverlayWindow.svg?style=flat)](https://cocoapods.org/pods/VolumeOverlayWindow)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 11 or above
- Xcode 10 or above
- Swift 4.0

## Installation

VolumeOverlayWindow is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VolumeOverlayWindow'
```

## Usage
Using the volume overlay is just drag and drop. Simply call:
```swift
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // It is acquired by 'viewWillLayoutSubviews' because SafedAreaInsets can not be acquired by viewdidload
        VolumeOverlay.shared.load()
    }
```

## Author

okanoryo, llcoolryo@gmail.com

## License

VolumeOverlayWindow is available under the MIT license. See the LICENSE file for more info.
