//
//  ButlerHomeViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import ImageSlideshow

class ButlerHomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var selectCategoryLogo: UIImageView!
    
    // for image Slide show
    @IBOutlet var slideshow: ImageSlideshow!
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var serviceNameArray = ["Home Cleaning Services","Laundry Services", "Financial and Wealth Planner","Financial Constultant"]
    
    var categoryLogoArray = ["homeClean.png","homecleanBlack.png","finance.png","currency.png"]
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var util = Util()
    override func viewDidLoad()
    {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.revealViewController().rearViewRevealWidth = 200
        
        scrollView.contentSize = CGSize(width:320, height: 550)
        // add scroll view to viw
        
        view.addSubview(scrollView)
        util.roundImage(selectCategoryLogo)
        
        
        // Image SLider
        
        //slideshow.backgroundColor = UIColor.whiteColor()
        slideshow.slideshowInterval = 5.0
       // slideshow.pageControlPosition = PageControlPosition.UnderScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor()
        slideshow.pageControl.pageIndicatorTintColor = UIColor.blackColor()
        
        
        //        AlamofireSource example
        //
        //slideshow.setImageInputs([AlamofireSource(urlString: "https://thumbs.dreamstime.com/z/flysch-rocks-barrika-beach-sunset-58426273.jpg")!, AlamofireSource(urlString: "https://thumbs.dreamstime.com/z/man-surfboard-beautiful-foggy-beach-boy-running-golden-sunrise-daytona-florida-58532550.jpg")!, AlamofireSource(urlString: "https://thumbs.dreamstime.com/z/woman-putting-mask-her-face-black-cloak-sitting-ground-58291716.jpg")!])
        
        
        
        //        Local image example
        //
                slideshow.setImageInputs([ImageSource(imageString: "laundryImage.jpg")!, ImageSource(imageString: "homeCleaning1.jpg")!, ImageSource(imageString: "carCleaning.jpg")!])
        
        let recognizer = UITapGestureRecognizer(target: self, action: "click")
        slideshow.addGestureRecognizer(recognizer)
        
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        categoryCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func click() {
        let ctr = FullScreenSlideshowViewController()
        ctr.pageSelected = {(page: Int) in
            self.slideshow.setScrollViewPage(page, animated: false)
        }
        
        ctr.initialPage = slideshow.scrollViewPage
        ctr.inputs = slideshow.images
        self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: slideshow);
        ctr.transitioningDelegate = self.transitionDelegate!
        self.presentViewController(ctr, animated: true, completion: nil)
    }

    
   
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCellWithReuseIdentifier("category", forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        
       
        categoryCell.layer.borderWidth = 1.0
        categoryCell.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        categoryCell.categoryLogo.image = UIImage(named:categoryLogoArray[indexPath.row] )
        
        categoryCell.categoryName.text = serviceNameArray[indexPath.row]
        
        
        return categoryCell
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellHeight = 150
        return CGSizeMake(collectionView.bounds.size.width/2, CGFloat(cellHeight))
    }
}
