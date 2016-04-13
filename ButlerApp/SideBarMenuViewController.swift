//
//  SideBarMenuViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SideBarMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var util = Util()
    var menuOptinArray = ["","BUTLER","MESSAGE","FAVORITE","MY OEDERS","NOTIFICATION",""]
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.darkGrayColor()
        
        self.tableView.allowsSelection = false
        
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell()
        
        
        if(indexPath.row == 0)
        {
            
            tableView.rowHeight = 200
            let profileCell = tableView.dequeueReusableCellWithIdentifier("profilePicCell")! as! SideBarProfileCell
        
            profileCell.nameLable.text = "Khalid Wani"
            
            util.roundImage(profileCell.profilePicImageView)
            
            profileCell.profilePicImageView.image = UIImage(named: "khalidWani.jpg")
            
            
            
            return profileCell
        }
        
       
            if(indexPath.row <= 5)
            {
                tableView.rowHeight = 44.0
                let menuOptionCell = tableView.dequeueReusableCellWithIdentifier("optionCell")! as! SideBarProfileCell
            
                menuOptionCell.menuOption.text = menuOptinArray[indexPath.row]
            
                menuOptionCell.subOption.text = ""
            
                if(indexPath.row == 1)
                {
                    menuOptionCell.optionLogoImage.image = UIImage(named: "ic_supervisor_account_white_36pt")
                }
                if(indexPath.row == 2)
                {
                    menuOptionCell.optionLogoImage.image = UIImage(named:"ic_add_alert_white_36pt")
                }
                if(indexPath.row == 3)
                {
                    menuOptionCell.optionLogoImage.image = UIImage(named: "ic_favorite_border_white_36pt")
                }
                if(indexPath.row == 4)
                {
                    menuOptionCell.optionLogoImage.image = UIImage(named: "ic_shopping_cart_white_36pt")
                    menuOptionCell.subOption.text = "3"
                    
                    menuOptionCell.subOption.layer.cornerRadius = 10
                    menuOptionCell.subOption.layer.borderWidth = 1
                    menuOptionCell.subOption.layer.backgroundColor = UIColor.whiteColor().CGColor
                    
                    
                }
                if(indexPath.row == 5)
                {
                    menuOptionCell.optionLogoImage.image = UIImage(named: "ic_add_alert_white_36pt")
                    menuOptionCell.subOption.text = "+27"

                    menuOptionCell.subOption.layer.cornerRadius = 10
                    menuOptionCell.subOption.layer.borderWidth = 1
                    menuOptionCell.subOption.layer.backgroundColor = UIColor.orangeColor().CGColor
                }
            
                return menuOptionCell
          
        }
        
        else
        {
             tableView.rowHeight = 130
            let socialCell = tableView.dequeueReusableCellWithIdentifier("socialSiteCell")!
            return socialCell
        }
        //return cell
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
