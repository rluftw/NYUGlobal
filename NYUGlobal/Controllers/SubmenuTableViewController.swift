//
//  WhereToStayTableViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/20/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit

class SubmenuTableViewController: UITableViewController {

    var options: [String]!
    var imageName: String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        imageView.image = UIImage(named: imageName)
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "waves")!)
    }
    
    // MARK: - Tableview data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("action", forIndexPath: indexPath) as! OptionTableViewCell

        cell.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "waves")!)
        cell.optionLabel.text = options[indexPath.row]

        return cell
    }
    
    // MARK: - Tableview delegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 94.0
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! OptionTableViewCell
        if cell.optionLabel.text == "Attractions" {
            performSegueWithIdentifier("ShowAttractions", sender: cell)
        } else if cell.optionLabel.text == "NYU Students" {
            performSegueWithIdentifier("ShowNYUStudents", sender: cell)
        } else if cell.optionLabel.text == "Trains" {
            performSegueWithIdentifier("ShowTrains", sender: cell)
        }
        
        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
