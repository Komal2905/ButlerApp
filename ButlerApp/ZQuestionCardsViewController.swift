//
//  ZQuestionCardsViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ZQuestionCardsViewController: UIViewController, ZCarouselDelegate {
    
    var menu: ZCarousel!
    var images: ZCarousel!
    
    var qView : ZCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menu = ZCarousel(frame: CGRect( x: self.view.frame.size.width/5,
            y: 100,
            width: (self.view.frame.size.width/5)*3,
            height: 50))
        menu.ZCdelegate = self
        menu.addButtons(["q1", "q2", "q3", "q4"])
        
        self.view.addSubview(menu!)
        
        qView = ZCarousel(frame: CGRect( x: self.view.frame.size.width/5,
            y: 200,
            width: (self.view.frame.size.width/5)*3,
            height: 150))
        
        qView.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1)
        //images.ZCdelegate = self
        
        //images.addImages(["1", "2", "3"])
        
        self.view.addSubview(qView)
        
    }
    
    func ZCarouselShowingIndex(scrollview: ZCarousel, index: Int) {
        if scrollview == menu {
            print("Showing Button at index \(index)")
        }
        else if scrollview == images {
            print("Showing Image at index \(index)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
