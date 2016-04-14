//
//  Util.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

// work as Utility function


import Foundation
import UIKit

public class Util
{
    
    func bottomBorderTextfield(textfield : UITextField)
    {
        
        let border = CALayer()
        let width = CGFloat(0.9)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: textfield.frame.size.height - width, width:  textfield.frame.size.width, height: textfield.frame.size.height)
        
        
               
        border.borderWidth = width
        textfield.layer.addSublayer(border)
        textfield.layer.masksToBounds = true
    }
    
    // only roundCorner
    func roundButton(button : UIButton)
    {
        // make button Raounded
       
        button.layer.cornerRadius = 20
        
        // define border of button
        
        button.layer.borderWidth = 1.0
        
        // define border color
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    
    
   // function for round ImageView
    
    // This function takes ImageView as a parameter and return round ImageView
    func roundImage(imageView : UIImageView)
    {
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
    }
    
    
    
    func roundImageGray(imageView : UIImageView)
    {
        imageView.layer.borderWidth = 2.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.darkGrayColor().CGColor
        
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
    }
}