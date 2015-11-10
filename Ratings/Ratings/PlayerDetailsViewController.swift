//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Brian J Glowe on 11/10/15.
//  Copyright © 2015 Brian Glowe. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!

    
    // this holds the value of the selected row, with a default value of "Chess" so there is always a selection
    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }

    var player:Player?

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
    
//THE CODE BELOW - this method declares that when the user selects the row, the text field will become the first responder. aka - the text field will be activated
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" { //segues only on the SavePlayerDetail segue
            player = Player(name: nameTextField.text!, game: "Chess", rating: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    /* This code will get executed once the user selects a game from the Choose Game Scene. This method 
    updates both the label on screen and the game property based on the game selected. The unwind segue 
    also pops GamePickerViewController off the navigation controller’s stack. */
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = gamePickerViewController.selectedGame {
                game = selectedGame
        }
    }
    
    // MARK: - Table view data source

}





