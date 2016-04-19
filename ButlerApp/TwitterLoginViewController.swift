//
//  TwitterLoginViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/19/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

import Firebase

import JSQMessagesViewController

class TwitterLoginViewController: UIViewController , UIActionSheetDelegate{
    

    var ref: Firebase!
    var authHelper: TwitterAuthHelper!
    var accounts: [ACAccount]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Firebase(url:"https://twitterloginforbutle.firebaseio.com/")
        authHelper = TwitterAuthHelper(firebaseRef: ref, twitterAppId: "hrPMSr9L1Xi7XUaOA6fqWgG48")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Fire Chat"
    }
    
    @IBAction func login(sender: UIButton) {
        self.authWithTwitter()
    }
    
    func authWithTwitter() {
        authHelper.selectTwitterAccountWithCallback { (error, accounts) -> Void in
            self.accounts = accounts as! [ACAccount]
            self.handleMultipleTwitterAccounts(self.accounts)
        }
    }
    
    func authAccount(account: ACAccount) {
        authHelper.authenticateAccount(account, withCallback: { (error, authData) -> Void in
            if error != nil {
                print("error",error.description)
            } else {
                // We have an authenticated Twitter user
                NSLog("%@", authData)
                // segue to chat
                self.performSegueWithIdentifier("TWITTER_LOGIN", sender: authData)
            }
        })
        
        // self.performSegueWithIdentifier("TWITTER_LOGIN", sender: nil)
        
        }
    
    func selectTwitterAccount(accounts: [ACAccount]) {
        let selectUserActionSheet = UIActionSheet(title: "Select Twitter Account", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Destruct", otherButtonTitles: "Other")
        
        for account in accounts {
            selectUserActionSheet.addButtonWithTitle(account.username)
        }
        
        selectUserActionSheet.cancelButtonIndex = selectUserActionSheet.addButtonWithTitle("Cancel")
        selectUserActionSheet.showInView(self.view);
    }
    
    func handleMultipleTwitterAccounts(accounts: [ACAccount]) {
        switch accounts.count {
        case 0:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://twitter.com/signup")!)
        case 1:
            self.authAccount(accounts[0])
        default:
            self.selectTwitterAccount(accounts)
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        let currentTwitterHandle = actionSheet.buttonTitleAtIndex(buttonIndex)
        for acc in accounts {
            if acc.username == currentTwitterHandle {
                self.authAccount(acc)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        
        let navVc = segue.destinationViewController as! UINavigationController // 1
        let messagesVc = navVc.viewControllers.first as! MessageViewController // 2
        
        if let authData = sender as? FAuthData {
            messagesVc.user = authData
            messagesVc.ref = ref
            
            
           // messagesVc.senderId = authData.providerData["username"] as! String
            
             messagesVc.senderId = authData.providerData["username"] as! String
            
            messagesVc.senderDisplayName = "Slack"
        
        }
        
        
            
    }
   


}
