//
//  AttractionVC.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/21/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit

class AttractionVC: UITableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if indexPath.row == 0 {
            performSegueWithIdentifier("MuseumIsland", sender: cell)
        } else if indexPath.row == 1 {
            performSegueWithIdentifier("Reichstag", sender: cell)
        } else {
            performSegueWithIdentifier("Charlie", sender: cell)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! AttractionDetailViewController
        
        
        if segue.identifier == "MuseumIsland" {
            destinationVC.image = UIImage(named: "museumisland")
            destinationVC.attractionDescription = "Museum Island features highlights like the Pergamon Museum, the Altes Museum, the Neues Museum, the Alte Nationalgalerie, Berlin Cathedral, and the Bode Museum. There’s a plethora of art, religion, and German history at your hands. Be sure to go into the crypt of the Berlin Cathedral where you can see the tombs of Kaisers and important historical german figureheads."
        } else if segue.identifier == "Reichstag" {
            destinationVC.image = UIImage(named: "reichstag")
            destinationVC.attractionDescription = "As the official seat of the German Parliament, the Reichstag affords amazing views of the city from its famous dome and roof terrace. Although it is free, lines are long during the day, so it’s best to visit at night. You are allowed to remain in the building until midnight, although the last entry is 10 pm. A free brochure, available as you enter the building, offers a pictorial guide to the Berlin skyline. "
        } else if segue.identifier == "Charlie" {
            destinationVC.image = UIImage(named: "charlie")
            destinationVC.attractionDescription = "Checkpoint Charlie was the name given by the Western Allies to the best-known Berlin Wall crossing point between East Berlin and West Berlin, during the Cold War. Though it serves as a mere tourist attraction now, the surrounding area contains amazing painted sections of the Berlin Wall that you should definitely check out."
        }
    }
    
}
