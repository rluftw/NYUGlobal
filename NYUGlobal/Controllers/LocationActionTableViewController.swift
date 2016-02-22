//
//  LocationActionTableViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationActionTableViewController: UITableViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var coordinates: (Double, Double)!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: coordinates.0, longitude: coordinates.1)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = centerCoordinate
        
        mapView.addAnnotation(annotation)
        mapView.centerCoordinate = centerCoordinate
        mapView.region.span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        mapView.camera.pitch = 45

        
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    // MARK: - Tableview delegate methods
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!
        performSegueWithIdentifier("ShowOptions", sender: cell)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 94.0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {        
        if segue.identifier == "ShowOptions" {
            let cell = sender as! UITableViewCell
            let submenuVC = segue.destinationViewController as! SubmenuTableViewController
            
            switch cell.tag {
            case 0:
                submenuVC.options = ["Attractions", "Eats", "Nightlife"]
                submenuVC.imageName = "do"
            case 1:
                submenuVC.options = ["NYU Students", "Hostels", "Hotels"]
                submenuVC.imageName = "stay"
            case 2:
                submenuVC.options = ["Trains", "Bus", "Cab"]
                submenuVC.imageName = "around"
            default: break
            }
            
        }
    }
}
