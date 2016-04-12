//
//  FirstQViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class FirstQViewController: UIViewController,SSRadioButtonControllerDelegate
{
    
    @IBOutlet var myRadioYesButton:DownStateButton?
    @IBOutlet var myRadioNoButton:DownStateButton?
    @IBOutlet var myRadioNo1Button:DownStateButton?
   
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button3: UIButton!
      var radioButtonController: SSRadioButtonsController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
              
       
        
        radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        
        
        myRadioNoButton?.downStateImage = "check.gif.png"
        myRadioNoButton?.myAlternateButton = [myRadioYesButton!]
        myRadioNoButton?.myAlternateButton = [myRadioNo1Button!]
        
        
        myRadioYesButton?.downStateImage = "check.gif.png"
        myRadioYesButton?.myAlternateButton = [myRadioNoButton!]
        myRadioYesButton?.myAlternateButton = [myRadioNo1Button!]
        
        
        myRadioNo1Button?.downStateImage = "check.gif.png"
        myRadioNo1Button?.myAlternateButton = [myRadioYesButton!]
        myRadioNo1Button?.myAlternateButton = [myRadioNoButton!]

        
        //var radioButtonController = SSRadioButtonsController()
        //radioButtonController.setButtonsArray([button1!,button2!])
    }

}

class DownStateButton : UIButton {
    
    var myAlternateButton:Array<DownStateButton>?
    
    var downStateImage:String? = "check.gif.png"{
        
        didSet{
            
            if downStateImage != nil {
                
                self.setImage(UIImage(named: downStateImage!), forState: UIControlState.Selected)
            }
        }
    }
    
    func unselectAlternateButtons(){
        
        if myAlternateButton != nil {
            
            self.selected = true
            
            for aButton:DownStateButton in myAlternateButton! {
                
                aButton.selected = false
            }
            
        }else{
            
            toggleButton()
        }
    }
    
    
    
    func toggleButton(){
        
        if self.selected==false{
            
            self.selected = true
        }else {
            
            self.selected = false
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches as! Set<UITouch>, withEvent: event)
    }
}

