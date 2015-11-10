//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Brian J Glowe on 11/10/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {

    var players:[Player] = playersData

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
                as! PlayerCellTableViewCell
            
            let player = players[indexPath.row] as Player
            cell.player = player
            return cell
    }
    
    /* the code below has been updated to fullfill the custom tableview Cell we created. The new code is above
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
        //1_(lines above) dequeueReusableCellWithIdentifier will dequeue an existing cell with the reuse identifier PlayerCell if available or create a new one if not.
        
        let player = players[indexPath.row] as Player
        //2_(line above) you look up the Player object correspoinding to the row being populated and assing it to player
        
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
        //3(above) it is key to use the custom TB cell tag to assign values. the labels and images are looked up by their tag on the cell and populated with data from the player object.
            nameLabel.text = player.name
        }
        if let gameLabel = cell.viewWithTag(101) as? UILabel {
            gameLabel.text = player.game
        }
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating(player.rating)
        }
        return cell
    }
    */

    /*
    the code below was used before a custom table view cell was created
    it shows the changes to cellForRowAtIndexPath required to used custom TB cell
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
    -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
    
    let player = players[indexPath.row] as Player
    cell.textLabel?.text = player.name
    cell.detailTextLabel?.text = player.game
    return cell
    }
    */

    
}
