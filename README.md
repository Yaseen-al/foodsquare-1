# foodsquare

## Description:
An iOS app for discovering local venues and create favorites from your results, using foursquare's API.

## Features:
* User can search for a venue
* The app shows results those results with annotations on a map
* The user can toggle between a map view and a list view
* If the user denies access to location, search still works
* User can create a collection
* User can add venues to a collection

### Table of Contents:
- [Requirements](#requirements)
- [Installation](#installation)
    - [CocoaPods:](#cocoapods)
    - [Pods required:](#pods-required)
- [Contributors](#contributors)
- [Credits](#credits)
- [License](#license)

### Requirements:

* iOS 8.0+ / Mac OS X 10.11+ / tvOS 9.0+
* Xcode 9.0+
* Swift 3.0+

### Installation:
##### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

##### Pods required
1. [KingFisher](https://github.com/onevcat/Kingfisher)
2. [SnapKit](https://github.com/SnapKit/SnapKit)
3. [Alamofire](https://github.com/Alamofire/Alamofire)

To integrate SnapKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SnapKit', '~> 4.0'
    pod 'Alamofire', '~> 4.5'
    pod 'Kingfisher', '~> 4.6'
end
```

Then, run the following command:

```bash
$ pod install
```

### Contributors:

Contributor|Role|Responsibilities|
|:-------------:|:------------:|:------------:|
| Clint Mejia | Technical Lead | In charge of maintaining the health of master branch and ensure that master is always safe to pull from.  Makes final decisions on project architecture in conversation with other team members |
| Margaret Chan | Project Manager | Is responsible for the health of the Trello or board.  Organizes daily standups |
| Alan Holguin | UI/UX | Is responsible for the design and flow of the app |
| Yaseen Al Dallash | QA | Is responsible for identifying bugs on master and that the final product is bug free |

### Credits:

- Margaret Chan ([@margarethchan](https://github.com/margarethchan))
- Alan Holguin ([@lynksdomain](https://github.com/lynksdomain))
- Yaseen Al Dallash ([@Yaseen-al](https://github.com/Yaseen-al))
- Clint Mejia ([@clint-steve-m](https://github.com/clint-steve-m))

### License:
