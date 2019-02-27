# Introduction 

This recipe will help you detect user's location and can be interepreted in location coordinates, city name, province name, country, and provides indication on Map. At the end, you can see how you can add your own custom locations via gpx files.

## Core Location:

Core Location provides services for determining a device’s geographic location, altitude, orientation, or position relative to a nearby iBeacon. The framework uses all available onboard hardware, including Wi-Fi, GPS, Bluetooth, magnetometer, barometer, and cellular hardware to gather data. 

# Getting Started
The sample project provided is executable on XCode 10.1 with swift 4.2

The first time that your app requests authorization, its authorization status is indeterminate and the system prompts the user to grant or deny the request. The system records the user's response and does not display this panel upon subsequent requests. After requesting permission and determining whether services are available, you start most services using the CLLocationManager object and receive the results in your associated delegate object.

1. In Info.plist add following to configure request location permission: 
```
<key>NSLocationAlwaysUsageDescription</key>
<string>Will you allow this app to always know your location?</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Do you allow this app to know your current location?</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Do you allow this app to know your current location?</string>
```
2. In your view controller:
* extend protocol *CLLocationManagerDelegate* 
* Add following in ViewDidLoad():
```
locationManager = CLLocationManager()
locationManager.delegate = self

// request for location authorization
locationManager.requestAlwaysAuthorization()

// location manager configuration
locationManager.desiredAccuracy = kCLLocationAccuracyBest

if CLLocationManager.locationServicesEnabled(){
locationManager.startUpdatingLocation()
}
```
* Conform *CLLocationManagerDelegate* protocol by implementing following functions:
```
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) 
func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
```
* MapView customizing:
Adjust MapView to center indicator, do following:
```
let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
mapView.setRegion(coordinateRegion, animated: true)
```
* Add custom location via gpx file:
Create new gpx file and add coordinates of the new location. For example, I have created Toronto.gpx
3.    API references: 
*  https://developer.apple.com/documentation/corelocation

# Build and Test
1. Build on simulator or a real device.
2. Allow 'Location' permission, by selecting "Always allow"/"When in use" option
3. You should be able to see logitude, lattitude, city and province of the location. By default, you should see Toronto coordinates.
4. On Xcode, you can change the location and the ViewController should behave appropriately.

# Contribute
The major interaction part is available in FirstViewController.swift, other developers can contribute or provide their suggestions.
