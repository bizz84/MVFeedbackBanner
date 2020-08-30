# MVFeedbackBanner


[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat
            )](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-ios-lightgrey.svg?style=flat
             )](https://developer.apple.com/resources/)
[![Language](http://img.shields.io/badge/swift-3.0-orange.svg?style=flat
             )](https://developer.apple.com/swift)
[![Issues](https://img.shields.io/github/issues/bizz84/MVFeedbackBanner.svg?style=flat
           )](https://github.com/bizz84/MVFeedbackBanner/issues)
[![Cocoapod](http://img.shields.io/cocoapods/v/MVFeedbackBanner.svg?style=flat)](http://cocoadocs.org/docsets/MVFeedbackBanner/)

**Ask the user to rate your app or give feedback with a simple customisable banner.**

Inspired by [this Medium story](https://medium.com/budi-brain/designing-in-app-survey-6163304e88dd#.kata5zlku) about designing an in-app survey.

<img src="https://github.com/bizz84/MVFeedbackBanner/raw/master/screenshots/video-preview.gif" width="320">

## Features

* Super easy integration with **Interface Builder** or **programmatically**
* **IBDesignable** support
* Customisable texts and background colors

## Banner flows

<img src="https://github.com/bizz84/MVFeedbackBanner/raw/master/screenshots/feedback-flow.png">


## Installation

### CocoaPods

**MVFeedbackBanner** can be installed as a [CocoaPod](https://cocoapods.org/) and builds as a Swift framework. To install, include this in your Podfile:

```ruby
pod 'MVFeedbackBanner'
```

Once installed, just ```import MVFeedbackBanner``` in your classes and you're good to go.

## Usage

See included sample demo app.

## Bonus: [UIView+NibLoadable](https://github.com/bizz84/MVFeedbackBanner/raw/master/Sources/UIView+NibLoadable)

This project includes some convenience Swift code for loading a UIView from nib programmatically, so that you just write this:

```swift
let banner = MVFeedbackBanner()
```

And the banner automatically loads from the associated xib file.

## License

Copyright (c) 2017 Andrea Bizzotto bizz84@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
