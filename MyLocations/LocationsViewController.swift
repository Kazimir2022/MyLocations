//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by Kazimir on 7.12.23.
//
import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {
  var managedObjectContext: NSManagedObjectContext!
  
  var locations = [Location]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 1
    let fetchRequest = NSFetchRequest<Location>()
    // 2
    let entity = Location.entity()
    fetchRequest.entity = entity
    // 3
    let sortDescriptor = NSSortDescriptor(
      key: "date",
      ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    do {
      // 4
      locations = try managedObjectContext.fetch(fetchRequest)
    } catch {
      fatalCoreDataError(error)
    }
  }
  
  // MARK: - Table View Delegates
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    locations.count
  }
  
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "LocationCell",
      for: indexPath) as! LocationCell
    
    let location = locations[indexPath.row]
    cell.configure(for: location)
    
    return cell
  }
}

