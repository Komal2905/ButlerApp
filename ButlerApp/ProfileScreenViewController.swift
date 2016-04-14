//
//  ProfileScreenViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/14/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var containerView = UIView()
    var util = Util()
    
    @IBOutlet weak var profilePicView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contactMeButton: UIButton!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var addFavroutButton: UIButton!
    
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var userSegment: UISegmentedControl!
    
    @IBOutlet weak var taskDoneView: UIView!
    
    @IBOutlet weak var testimonialsView: UIView!
    
    @IBOutlet weak var serviceView: UIView!
    
    @IBAction func indexChanged(userSegment : UISegmentedControl) {
        // This all works fine and it prints out the value of 3 on any click
        
        switch userSegment.selectedSegmentIndex {
        case 0:
            print("first segement clicked")
            taskDoneView.hidden = false
            testimonialsView.hidden = true
            serviceView.hidden = true
            
        case 1:
            print("second segment clicked")
            
            taskDoneView.hidden = true
            testimonialsView.hidden = false
            serviceView.hidden = true
        case 2:
            
            taskDoneView.hidden = true
            testimonialsView.hidden = true
            serviceView.hidden = false
            
        default:
            break;
        }  //Switch
    }
    
    var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        containerView.backgroundColor = UIColor.brownColor()
        scrollView.backgroundColor = UIColor.whiteColor()
        util.roundImage(profilePic)
        util.roundButton(contactMeButton)
    
        scrollView.contentSize = CGSize(width:320, height: 700)
        
        
        //userSegment.selectedSegmentIndex = UISegmentedControlNoSegment
        
        userSegment.selectedSegmentIndex = 1
        
        scrollView.addSubview(profilePicView)

        view.addSubview(scrollView)

        
        
        taskDoneView.hidden = true
        testimonialsView.hidden = false
        serviceView.hidden = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        scrollView.frame = view.bounds
//        containerView.frame = CGRectMake(10, 10, scrollView.contentSize.width, scrollView.contentSize.height)
//    }
//    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
