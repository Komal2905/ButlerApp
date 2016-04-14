//
//  NotificationViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/14/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var util = Util()
    
    var nameArray = ["Shahrukh Khan","Salman Khan","Narenda Modi","Irfan khan","Rahul Dravid","Adam D'Anglo", "Huge Jackman","Ralf Stephens"]
    
    var serviceArray = ["PITHCED 200 $ FOR ACTIONG SERVICE","PITHCED 1200 $ FOR ACTIONG SERVICE","PITHCED 300 $ FOR ACTIONG SERVICE","PITHCED 400 $ FOR ACTIONG SERVICE","PITHCED 500 $ FOR ACTIONG SERVICE","PITHCED 500 $ FOR ACTIONG SERVICE","PITHCED 700 $ FOR ACTIONG SERVICE","PITHCED 800 $ FOR ACTIONG SERVICE"]

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        tableView.rowHeight = 60
        // tableView.rowHeight = 210
        let notificationCell = tableView.dequeueReusableCellWithIdentifier("notificaton")! as! NotificationCell
        
        
        util.roundImageGray(notificationCell.profileImage)
        
        notificationCell.nameLabel.text = nameArray[indexPath.row]
        
        notificationCell.pitchedLable.text = serviceArray[indexPath.row]
        
        return notificationCell
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
