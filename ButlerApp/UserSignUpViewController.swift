//
//  UserSignUpViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

// purpose : This file is use for UserSign Up

import UIKit

class UserSignUpViewController: UIViewController
{

    var util = Util()
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBOutlet weak var facebookButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBAction func userSignUpButtonPressed(sender: AnyObject)
    {
        
        let alert = UIAlertController(title: "Alert", message: "Show Home screen", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.buttomSetUp()
        
        util.roundButton(signUpButton)
        util.bottomBorderTextfield(userNameTextField)
        util.bottomBorderTextfield(emailTextField)
        util.bottomBorderTextfield(passwordTextField)
        util.bottomBorderTextfield(confirmPasswordTextField)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func buttomSetUp()
    {
        facebookButton.layer.cornerRadius = 20
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
