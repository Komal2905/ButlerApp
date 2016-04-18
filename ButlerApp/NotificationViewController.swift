//
//  NotificationViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/14/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

import Firebase

import JSQMessagesViewController

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var util = Util()
    
    @IBOutlet weak var tableView: UITableView!
    var nameArray = ["Shahrukh Khan","Salman Khan","Narenda Modi","Irfan khan","Rahul Dravid","Adam D'Anglo", "Huge Jackman","Ralf Stephens"]
    
    var serviceArray = ["PITHCED 200 $ FOR ACTIONG SERVICE","PITHCED 1200 $ FOR ACTIONG SERVICE","PITHCED 300 $ FOR ACTIONG SERVICE","PITHCED 400 $ FOR ACTIONG SERVICE","PITHCED 500 $ FOR ACTIONG SERVICE","PITHCED 500 $ FOR ACTIONG SERVICE","PITHCED 700 $ FOR ACTIONG SERVICE","PITHCED 800 $ FOR ACTIONG SERVICE"]
    
     var ref: Firebase! // for char window
    
    
    
     @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBOutlet weak var favButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //self.revealViewController().rearViewRevealWidth = 200
        
        // For Chat FireBase
        ref = Firebase(url: "https://notificationbutlerchat.firebaseio.com") // 2
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
       
        
       // tableView.rowHeight = 60
        // tableView.rowHeight = 210
        let notificationCell = tableView.dequeueReusableCellWithIdentifier("notificaton")! as! NotificationCell
        if(indexPath.row == 2)
        {
    
            util.roundImage(notificationCell.profileImage)
        
            notificationCell.nameLabel.text = nameArray[indexPath.row]
        
            notificationCell.pitchedLable.text = serviceArray[indexPath.row]
        
            return notificationCell
        }
            
        
        
        if(indexPath.row == 4)
        {
            
            util.roundImage(notificationCell.profileImage)
            
            notificationCell.nameLabel.text = nameArray[indexPath.row]
            
            notificationCell.pitchedLable.text = serviceArray[indexPath.row]
            //notificationCell.somelogo.setImage(UIImage(named: "Toggle On-52.png"), forState: .Normal)
            return notificationCell
        }
        
        else
        {
            util.roundImage(notificationCell.profileImage)
            
            notificationCell.nameLabel.text = nameArray[indexPath.row]
            
            notificationCell.pitchedLable.text = serviceArray[indexPath.row]
            //notificationCell.somelogo.hidden = true
            return notificationCell
        }
        
//        ref.authAnonymouslyWithCompletionBlock { (error, authData) in
//            if error != nil {print("You have one error",error.description); return}
//            
//            
//            self.performSegueWithIdentifier("startChat", sender: nil)
//        }

    }
    
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//         tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.textColor = UIColor.blackColor()
//        //print("didSelectRowAtIndexPath",didSelectRowAtIndexPath)
//        var select = false
//        
//         var selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! NotificationCell
//
//            print("Selected ",indexPath.row)
//        
//            selectedCell.somelogo.setImage(UIImage(named: "Like Filled-52.png"), forState: .Normal)
//        
//            tableView.deselectRowAtIndexPath(indexPath, animated: true)
//
//    }
    
    var isSelected : Bool = false
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        print("Selected    00 ")
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! NotificationCell
        if(isSelected == false)
        {
            
        
            print("IF selected ",indexPath.row)
        
            selectedCell.somelogo.setImage(UIImage(named: "Like Filled-52.png"), forState: .Normal)
        
            //tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            isSelected = true
        }
        
        else
        {
            print("ELSE selected ",indexPath.row)
            selectedCell.somelogo.setImage(UIImage(named: "Like Filled-52-2.png"), forState: .Normal)
            isSelected = false
        }
        
        
        ref.authAnonymouslyWithCompletionBlock { (error, authData) in
            if error != nil {print("You have one error",error.description); return}
            
            
            self.performSegueWithIdentifier("startChat", sender: nil)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        
        let navVc = segue.destinationViewController as! UINavigationController
        let chatVc = navVc.viewControllers.first as! ChatViewController
        
       
        chatVc.senderId = ref.authData.uid
        
        chatVc.senderDisplayName = ""
        
        
    }
    
    
//    var isDeSelected : Bool = false
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
//    {
//         let deselectedCell = tableView.cellForRowAtIndexPath(indexPath)!  as! NotificationCell
//        if(isDeSelected == false)
//        {
//           
//        
//            deselectedCell.somelogo.setImage(UIImage(named: "Like Filled-52-2.png"), forState: .Normal)
//            isDeSelected = true
//        }
//        
//        else
//        {
//            deselectedCell.somelogo.setImage(UIImage(named: "Like Filled-52.png"), forState: .Normal)
//            
//            isSelected = true
//            isDeSelected = false
//        }
//        
//    }
    
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            nameArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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
