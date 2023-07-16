//
//  ViewController.swift
//  MyLocations
//
//  Created by Kazimir on 16.07.23.
//

import UIKit
import CoreLocation

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var latitudeLabel: UILabel!
  @IBOutlet weak var longitudeLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var tagButton: UIButton!
  @IBOutlet weak var getButton: UIButton!
  
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Actions
  @IBAction func getLocation() {
    let authStatus = locationManager.authorizationStatus
    if authStatus == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
      return
    }
    if authStatus == .denied || authStatus == .restricted {
      showLocationServicesDeniedAlert()
      return
    }
    
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.startUpdatingLocation()
  }
  
  // MARK: - CLLocationManagerDelegate
  func locationManager(
    _ manager: CLLocationManager,
    didFailWithError error: Error
  ) {
    print("didFailWithError \(error.localizedDescription)")
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    let newLocation = locations.last!
    print("didUpdateLocations \(newLocation)")
  }
  
  // MARK: - Helper Methods
  func showLocationServicesDeniedAlert() {
    let alert = UIAlertController(
      title: "Location Services Disabled",
      message: "Please enable location services for this app in Settings.",
      preferredStyle: .alert)

    let okAction = UIAlertAction(
      title: "OK",
      style: .default,
      handler: nil)
    alert.addAction(okAction)

    present(alert, animated: true, completion: nil)
  }
}

