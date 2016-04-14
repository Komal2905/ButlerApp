//
//  ProfileScreeViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ProfileScreeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var profileTableView: UITableView!
    
   
    
    
    var util = Util()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
  
        if(indexPath.row == 0)
        {
            tableView.rowHeight = 210
            let profileCell = tableView.dequeueReusableCellWithIdentifier("profilePicCell")! as! ProfileTableCell
            util.roundImage(profileCell.profilePicImageView)
    
            util.roundButton(profileCell.addFavouriteButton)
            util.roundButton(profileCell.contactMeButton)
            
            profileCell.sendMessageButton.layer.cornerRadius = 20
            
            // define border of button
            
            profileCell.sendMessageButton.layer.borderWidth = 0.5
            
            // define border color
            profileCell.sendMessageButton.layer.borderColor = UIColor.whiteColor().CGColor
            
            
            profileCell.addFavouriteButton.layer.cornerRadius = 20
            
            // define border of button
            
            profileCell.addFavouriteButton.layer.borderWidth = 0.5
            
            // define border color
            profileCell.addFavouriteButton.layer.borderColor = UIColor.whiteColor().CGColor
            
            
            
            return profileCell
        }
            
        if(indexPath.row == 1)
        {
            tableView.rowHeight = 44.0
            let segmentCell = tableView.dequeueReusableCellWithIdentifier("segemtCell")! as! ProfileTableCell
            
            if( segmentCell.userProfileSegment.selectedSegmentIndex == 1)
            {
                print("Task DOne")
            }
            if( segmentCell.userProfileSegment.selectedSegmentIndex == 0)
            {
                print("Testin")
            }
            if( segmentCell.userProfileSegment.selectedSegmentIndex == 2)
            {
                print("Sevice")
            }
            
                      return segmentCell
        }
            
        if(indexPath.row == 2)
        {
            tableView.rowHeight = 230
            let aboutMeCell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell")!
            return aboutMeCell

        }
            
        
        else
        {
            tableView.rowHeight = 150
            let testimonialsCell = tableView.dequeueReusableCellWithIdentifier("testimonialsCell")! as! ProfileTableCell
            
            util.roundImage(testimonialsCell.testimonialsImageView)
            return testimonialsCell
  
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
