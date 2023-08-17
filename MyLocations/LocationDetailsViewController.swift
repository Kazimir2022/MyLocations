//
//  LocationDetailsViewControllerTableViewController.swift
//  MyLocations
//
//  Created by Kazimir on 8.08.23.
//

import UIKit

class LocationDetailsViewController: UITableViewController {
  @IBOutlet var descriptionTextView: UITextView!
  @IBOutlet var categoryLabel: UILabel!
  @IBOutlet var latitudeLabel: UILabel!
  @IBOutlet var longitudeLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!
  @IBOutlet var dateLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  @IBAction func done() {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
  }
  
}
