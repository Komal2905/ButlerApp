//
//  SplashScreen.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

//
//  SplashScreen.swift
//  ButlerApp
//

// purpose : This file is used for ImageSlider
//  Created by ProjectHeena on 4/8/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController,UIPageViewControllerDataSource
{
    
    
    private var pageViewController: UIPageViewController?
    
    
    var sliderImages = ["1.jpg","2.jpg","3.jpg"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createPageViewController()
        setupPageControl()
        
        let lineWidth = CGFloat(7.0)
        let rect = CGRectMake(0.0, 0.0, 150.0, 150.0)
        let sides = 6
        
        let path = roundedPolygonPath(rect, lineWidth: lineWidth, sides: sides, cornerRadius: 15.0, rotationOffset: CGFloat(-M_PI / 6.0))
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = CGRectMake(0.0, 0.0, path.bounds.width + lineWidth, path.bounds.height + lineWidth)
        borderLayer.path = path.CGPath
        borderLayer.lineWidth = lineWidth
        borderLayer.lineJoin = kCALineJoinRound
        borderLayer.lineCap = kCALineCapRound
        borderLayer.strokeColor = UIColor.blackColor().CGColor
        borderLayer.fillColor = UIColor.whiteColor().CGColor
        
        let image = createImage(borderLayer)
        
        
        //self.pageViewController!.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 200)
        
        
    }
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        //pageController.view.backgroundColor = UIColor.clearColor()
        
        
        pageController.dataSource = self
        
        if sliderImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl()
    {
        
        //
        var uIPageControl = UIPageControl()
        //
        //
        uIPageControl.pageIndicatorTintColor = UIColor.redColor()
        uIPageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        uIPageControl.backgroundColor = UIColor.redColor()
        uIPageControl.frame = CGRect(x: 0, y: 100, width: 400, height: 120)
        //self.view.bringSubviewToFront(uIPageControl)
        
        
        
        let appearance = UIPageControl.appearance()
        // let appearance = UIPageControl()
        //appearance.hidden = true
        
        
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.blackColor()
        appearance.backgroundColor = UIColor.clearColor()
        
        //self.view.bringSubviewToFront(uIPageControl)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! ImageSliderViewController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! ImageSliderViewController
        
        if itemController.itemIndex+1 < sliderImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> ImageSliderViewController? {
        
        if itemIndex < sliderImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ImageSlideViewController") as! ImageSliderViewController
            
            //pageItemController.view.backgroundColor = UIColor.clearColor()
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = sliderImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return sliderImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func roundedPolygonPath(rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat, rotationOffset: CGFloat = 0) -> UIBezierPath
    {
        let path = UIBezierPath()
        let theta: CGFloat = CGFloat(2.0 * M_PI) / CGFloat(sides) // How much to turn at every corner
        let offset: CGFloat = cornerRadius * tan(theta / 2.0)     // Offset from which to start rounding corners
        let width = min(rect.size.width, rect.size.height)        // Width of the square
        
        let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)
        
        // Radius of the circle that encircles the polygon
        // Notice that the radius is adjusted for the corners, that way the largest outer
        // dimension of the resulting shape is always exactly the width - linewidth
        let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0
        
        // Start drawing at a point, which by default is at the right hand edge
        // but can be offset
        var angle = CGFloat(rotationOffset)
        
        let corner = CGPointMake(center.x + (radius - cornerRadius) * cos(angle), center.y + (radius - cornerRadius) * sin(angle))
        path.moveToPoint(CGPointMake(corner.x + cornerRadius * cos(angle + theta), corner.y + cornerRadius * sin(angle + theta)))
        
        for _ in 0..<sides {
            angle += theta
            
            let corner = CGPointMake(center.x + (radius - cornerRadius) * cos(angle), center.y + (radius - cornerRadius) * sin(angle))
            let tip = CGPointMake(center.x + radius * cos(angle), center.y + radius * sin(angle))
            let start = CGPointMake(corner.x + cornerRadius * cos(angle - theta), corner.y + cornerRadius * sin(angle - theta))
            let end = CGPointMake(corner.x + cornerRadius * cos(angle + theta), corner.y + cornerRadius * sin(angle + theta))
            
            path.addLineToPoint(start)
            path.addQuadCurveToPoint(end, controlPoint: tip)
        }
        
        path.closePath()
        
        // Move the path to the correct origins
        let bounds = path.bounds
        let transform = CGAffineTransformMakeTranslation(-bounds.origin.x + rect.origin.x + lineWidth / 2.0, -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
        path.applyTransform(transform)
        
        return path
    }
    
    func createImage(layer: CALayer) -> UIImage
    {
        let size = CGSizeMake(CGRectGetMaxX(layer.frame), CGRectGetMaxY(layer.frame))
        UIGraphicsBeginImageContextWithOptions(size, layer.opaque, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        
        layer.renderInContext(ctx!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    
}
