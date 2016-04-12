//
//  ImageSliderViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

//
//  ImageSliderViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/8/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

// as a page Item
import UIKit

class ImageSliderViewController: UIViewController
{
    @IBOutlet weak var slidingImage: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var itemIndex: Int = 0 // ***
    
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = slidingImage {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.slidingImage.image = UIImage(named: imageName)
        
        /*
         pageControl.pageIndicatorTintColor = UIColor.whiteColor()
         pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
         pageControl.backgroundColor = UIColor.clearColor()
         self.view.bringSubviewToFront(pageControl)
         
         
         let appearance = UIPageControl.appearance()
         appearance.pageIndicatorTintColor = UIColor.grayColor()
         appearance.currentPageIndicatorTintColor = UIColor.blackColor()
         appearance.backgroundColor = UIColor.clearColor()
         
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
