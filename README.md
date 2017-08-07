SRCountdownTimer ![Pod status](https://cocoapod-badges.herokuapp.com/v/SRCountdownTimer/badge.png)
---
This is the simple circle countdown with a configurable timer
<p align="center">
  <img src="https://github.com/rsrbk/SRCountdownTimer/blob/master/demo.gif?raw=true" alt="Demo gif"/>
</p>

Installation
---
The most preferable way to use this library is cocoapods. Add the following line to your `Podfile`:
```sh
pod 'SRCountdownTimer'
```
and run `pod install` in your terminal.

Alternatively, you can manually add the files in the `SRCountdownTimer` directory to your project.

Usage
--
Create a custom instance of SRCountdownTimer(subclass of UIView) using the storyboard or directly in the code.

You can customize different properties:
```swift
public var lineWidth: CGFloat = 2.0
public var lineColor: UIColor = .black
public var trailLineColor: UIColor = UIColor.lightGray.withAlphaComponent(0.5)

public var isLabelHidden: Bool = false
public var labelFont: UIFont?
public var labelTextColor: UIColor?
public var timerFinishingText: String?
```
The last(timerFinishingText) means the text that will be shown after timer expires. If nil - it'll show the current counter value(0).

Use this method to start the countdown:
```swift
public func start(beginingValue: Int, interval: TimeInterval = 1)
```

To pause:
```swift
public func pause()
```

To resume(will start from the current state of view)
```swift
public func resume()
```

SRCountdownTimerDelegate
--
```swift
@objc optional func timerDidUpdateCounterValue(newValue: Int)
@objc optional func timerDidStart()
@objc optional func timerDidPause()
@objc optional func timerDidResume()
@objc optional func timerDidEnd()
```

Shoutout
--
This was inspired by https://github.com/johngraham262/JWGCircleCounter

License
--
 MIT License

 Copyright (c) 2017 Ruslan Serebriakov <rsrbk1@gmail.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
