# RKDropDownTextField

[![CI Status](http://img.shields.io/travis/radhakrishnapai/RKDropDownTextField.svg?style=flat)](https://travis-ci.org/radhakrishnapai/RKDropDownTextField)
[![Version](https://img.shields.io/cocoapods/v/RKDropDownTextField.svg?style=flat)](http://cocoapods.org/pods/RKDropDownTextField)
[![License](https://img.shields.io/cocoapods/l/RKDropDownTextField.svg?style=flat)](http://cocoapods.org/pods/RKDropDownTextField)
[![Platform](https://img.shields.io/cocoapods/p/RKDropDownTextField.svg?style=flat)](http://cocoapods.org/pods/RKDropDownTextField)

![enter image description here](https://github.com/radhakrishnapai/RKDropDownTextField/blob/master/Example/Images/RKDropDownTextField.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Intro

RKDropDownTextField is a quick to install easy to use dropdown textField for iOS.

## How to use
1. Drag and drop a `UIView` into storyboard. 
2. Change its class to `RKDropDownTextField`.
![enter image description here](https://github.com/radhakrishnapai/RKDropDownTextField/blob/master/Example/Images/Custom_Class.png)

3. Set necessary attributes in the attributes inspector.
![enter image description here](https://github.com/radhakrishnapai/RKDropDownTextField/blob/master/Example/Images/Attributes_Inspector.png)
4. Create outlet.
5. Set `delegate` as the object which conforms to the protocol `<RKDropDownTextFieldDelegate>`.
6. Populate `values` array with the possible dropdown values.
![enter image description here](https://github.com/radhakrishnapai/RKDropDownTextField/blob/master/Example/Images/Code.png)
7. Implement delegate method 

        - (void)dropDownTextField:(RKDropDownTextField *)dropDownTextField
	      didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        // Your code goes here
        }

7. Set the property `values` with the possible values the list must contain.

You are done! Run the code and try tapping on the DropDownTextField.

## Requirements
iOS 8.0. Objective C.

## Installation

RKDropDownTextField is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RKDropDownTextField"
```

## Author

Radhakrishna Pai, radhakrishnapai09@gmail.com

## License

RKDropDownTextField is available under the MIT license. See the LICENSE file for more info.
