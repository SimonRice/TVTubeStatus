# TV Tube Status

[![Twitter: @_simonrice](https://img.shields.io/badge/contact-@__simonrice-blue.svg?style=flat)](https://twitter.com/_simonrice)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/simonrice/TVTubeStatus/blob/master/LICENSE)

This is a tvOS app that shows the status of all London Underground, Overground, Croydon Tramlink, TfL Rail & Docklands Light Railway routes in London.  It also happens to be my first attempt of building a tvOS app from the ground up.

On the tech stack front, it's currently written in Swift 3, uses Transport for London's latest API, taking advantage of RxSwift.

## Installation Instructions

You can use Xcode 8 or above to install NetTime on your iOS device & watch using just your Apple ID.

All you need to do is:

1. Install Xcode via [download](https://developer.apple.com/xcode/download/) or through the Mac App Store.
1. Run `git clone https://github.com/simonrice/TVTubeStatus.git` in a terminal application of your choice.
1. Open "NetTime.xcodeproj" in Xcode.
1. Go to Xcode's Preferences > Accounts and add your Apple ID.
1. In Xcode's sidebar select each target and go to General > Identity. Append a word at the end of the **Bundle Identifier** e.g. com.simonrice.TVTubeStatus**.name** so it's unique. Select your Apple ID in Signing > Team.
1. Connect your iPad or iPhone using USB and select it in Xcode's Product menu > Destination.
1. Press CMD+R or Product > Run to install TV Tube Status.
1. If you install using a free (non-developer) account, make sure to rebuild TV Tube Status every 7 days, otherwise it will quit at launch when your certificate expires.

## License

This app is licensed under the terms of the MIT license. Please see the [LICENSE](LICENSE) file.
