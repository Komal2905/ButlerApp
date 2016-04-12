//
//  QuestionsViewController.swift
//  ButlerApp
//
//  Created by Vidya Ramamurthy on 09/04/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    

    @IBOutlet weak var nextButton: UIButton!
    
    var tutorialPageViewController: PageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: "didChangePageControlValue", forControlEvents: .ValueChanged)
        
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            }, completion: { (fininshed: Bool) -> () in
        })
    
        nextButton.layer.cornerRadius = 15
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.blackColor().CGColor
        
        //var radioButtonController = SSRadioButtonsController()
        //radioButtonController.setButtonsArray([button1!,button2!])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tutorialPageViewController = segue.destinationViewController as? PageViewController
        {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }
    
    @IBAction func didTapNextButton(sender: UIButton) {
        tutorialPageViewController?.scrollToNextViewController()
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension QuestionsViewController: PageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: PageViewController,
        didUpdatePageCount count: Int) {
            pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: PageViewController,
        didUpdatePageIndex index: Int) {
            pageControl.currentPage = index
    }
    
    
    

}


class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "check.gif")! as UIImage
    let uncheckedImage = UIImage(named: "Unknown.jpg")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, forState: .Normal)
            } else {
                self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
   
    
    // for radio button
    override var selected: Bool {
        didSet {
            toggleButon()
        }

    }
    
    
    /**
     Toggles selected state of the button.
     */
    func toggleButon() {
        if self.selected
        {
               self.setImage(checkedImage, forState: .Normal)
        } else
        {
            self.setImage(uncheckedImage, forState: .Normal)
        }
    }
    
   /*
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            if isChecked == true {
                isChecked = false
            } else {
                isChecked = true
            }
        }
    }*/
    
    
}



//class DownStateButton : UIButton {
//    
//    var myAlternateButton:Array<DownStateButton>?
//    
//    var downStateImage:String? = "radiobutton_down.png"{
//        
//        didSet{
//            
//            if downStateImage != nil {
//                
//                self.setImage(UIImage(named: downStateImage!), forState: UIControlState.Selected)
//            }
//        }
//    }
//    
//    func unselectAlternateButtons(){
//        
//        if myAlternateButton != nil {
//            
//            self.selected = true
//            
//            for aButton:DownStateButton in myAlternateButton! {
//                
//                aButton.selected = false
//            }
//            
//        }else{
//            
//            toggleButton()
//        }
//    }
//    
//
//    
//    func toggleButton(){
//        
//        if self.selected==false{
//            
//            self.selected = true
//        }else {
//            
//            self.selected = false
//        }
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        unselectAlternateButtons()
//        super.touchesBegan(touches as! Set<UITouch>, withEvent: event)
//    }
//}



