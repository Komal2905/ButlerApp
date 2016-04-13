//
//  UserSignInViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//
//  Purpose : This file used fot SignInViewController


import UIKit

class UserSignInViewController: UIViewController
{

    @IBOutlet weak var signInButton: UIButton!
    
    
    @IBOutlet weak var signInFacebookButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func userSignInButton(sender: AnyObject)
    {
        
        let alert = UIAlertController(title: "Alert", message: "Please Sign Up or enter valid password", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    var util = Util()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setUpView()
        
        util.bottomBorderTextfield(emailTextField)
        util.bottomBorderTextfield(passwordTextField)
    }

    
    
    // this function set the views for button
    func setUpView()
    {
        // make button Raounded
        signInFacebookButton.layer.cornerRadius = 20
        signInButton.layer.cornerRadius = 20
        signUpButton.layer.cornerRadius = 20
        
        // define border of button
        signInButton.layer.borderWidth = 1.0
        signUpButton.layer.borderWidth = 1.0
        
        // define border color
        signInButton.layer.borderColor = UIColor.whiteColor().CGColor
        signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
        
//        //UIView.animateWithDuration(2, delay: 0, options: .BeginFromCurrentState, animations: { () -> Void in
//            self.emailTextField.frame = CGRectOffset(self.emailTextField.frame, -500, 0)
//            }, completion: nil)
        
        self.emailTextField.shake(10,withDelta: 5.0,speed: 0.03)  // 5 points wide
        
        
        
        
    }
    
    // this function set TextField 
  
    
    override func didReceiveMemoryWarning()
    {
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
