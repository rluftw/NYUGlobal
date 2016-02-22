//
//  MainViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/19/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UITableViewController {
    
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    
    @IBAction func logOut(sender: AnyObject) {
        let ref = (UIApplication.sharedApplication().delegate as! AppDelegate).ref
        ref.unauth()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Tableview delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        performSegueWithIdentifier("showDetail", sender: cell)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let cell = sender as! UITableViewCell
            let locationActionsVC = segue.destinationViewController as! LocationActionTableViewController
            
            switch cell.tag {
            case 0: locationActionsVC.coordinates = LocationCoordinateConstants.AbuDhabi
            case 1: locationActionsVC.coordinates = LocationCoordinateConstants.Accra
            case 2: locationActionsVC.coordinates = LocationCoordinateConstants.Berlin
            case 3: locationActionsVC.coordinates = LocationCoordinateConstants.BuenosAires
            case 4: locationActionsVC.coordinates = LocationCoordinateConstants.Florence
            case 5: locationActionsVC.coordinates = LocationCoordinateConstants.London
            case 6: locationActionsVC.coordinates = LocationCoordinateConstants.Madrid
            case 7: locationActionsVC.coordinates = LocationCoordinateConstants.NewYork
            case 8: locationActionsVC.coordinates = LocationCoordinateConstants.Paris
            case 9: locationActionsVC.coordinates = LocationCoordinateConstants.Prague
            case 10: locationActionsVC.coordinates = LocationCoordinateConstants.Shanghai
            case 11: locationActionsVC.coordinates = LocationCoordinateConstants.Sydney
            case 12: locationActionsVC.coordinates = LocationCoordinateConstants.TelAviv
            case 13: locationActionsVC.coordinates = LocationCoordinateConstants.WashingtonDC
            default: return
            }
        }
    }
}
