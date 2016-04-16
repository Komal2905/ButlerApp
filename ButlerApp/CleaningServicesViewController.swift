//
//  CleaningServicesViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/15/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class CleaningServicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

{
    var util  = Util()
    var colors = Colors()
    var serviceImageArray = ["laundry.jpg","homeCleaningService.jpg","carwashingService.jpg",]
    
    var serviceNameArray = ["Laundry and Dry Cleanning", "Home Cleaning","Car Wash and Servicing"]
    
    var availService = ["No Service Provider available", "777 Butlers ready to service","14 service provider in your area"]
    
    var availServiceLogo = ["serviceAvail.png","serviceUnavail.png","serviceAvail.png"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell = UITableViewCell()
        
        // tableView.rowHeight = 60
        // tableView.rowHeight = 210
        let cleaningSeviceCell = tableView.dequeueReusableCellWithIdentifier("cleaningServiceCell")! as! ServiceCell
        if(indexPath.row == 1)
        {
        cleaningSeviceCell.serviceNameLabel.backgroundColor = UIColor.clearColor()
        let backgroundLayer = colors.gl
        backgroundLayer.frame = cleaningSeviceCell.serviceNameLabel.frame
        cleaningSeviceCell.serviceNameLabel.layer.insertSublayer(backgroundLayer, atIndex: 1)
        
        }
        
        
        cleaningSeviceCell.serviceBackgroundImage.image = UIImage(named: serviceImageArray[indexPath.row])
        cleaningSeviceCell.serviceSubLable.text = availService[indexPath.row]
        cleaningSeviceCell.serviceNameLabel.text = serviceNameArray[indexPath.row]
        cleaningSeviceCell.availImageView.image = UIImage(named: availServiceLogo[indexPath.row])
        

        
        
        util.roundImage(cleaningSeviceCell.availImageView)
        return cleaningSeviceCell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        var selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! ServiceCell
        let msg = "You have selected \(serviceNameArray[indexPath.row])"
        
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

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
