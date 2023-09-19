# E-commerce-Task

**Getting Start**
1. Make sure the version of Xcode supports ios 16
2. install Cocoapods
3. run pod install mostly you will need to VPN to install pods

**Architecture**
1. The E-commerce Task is using VIPER Pattern
   - View: The responsibility of the view is to send the user actions to the presenter and shows whatever the presenter tells it.
   - Interactor: This is the backbone of an application as it contains the business logic.
   - Presenter: Its responsibility is to get the data from the interactor on user actions and after getting data from the interactor, it sends it to the view to show it. It also asks the router/wireframe for navigation.
   - Entity: It contains basic model objects used by the Interactor.
   - Router: It has all navigation logic for describing which screens are to be shown when. It is normally written as a wireframe.

**Structure**
1. Shared: contains shared UI items or app constants that could used
2. Product Modeul: Handle showing list of products
3. Cart Module: Handle showing cart contains

**Dependencies**
Depend on Cocapods for thirdpart library
1. pod 'Alamofire' for calling api
2. pod 'Kingfisher' for loading url images

