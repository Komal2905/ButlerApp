//
//  TestimonialsViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/14/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TestimonialsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var testimonialsTableView: UITableView!
    var util = Util()
    override func viewDidLoad()
    {
        super.viewDidLoad()

         testimonialsTableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
       
           // tableView.rowHeight = 210
        let testimonialsCell = tableView.dequeueReusableCellWithIdentifier("testimonialsCell")! as! ProfileTableCell
        util.roundImage(testimonialsCell.testmonialsProfilePic)
       
        return testimonialsCell
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
