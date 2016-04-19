//
//  MessageViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/19/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

import Firebase

import JSQMessagesViewController

class MessageViewController: JSQMessagesViewController
{
    // MARK: Properties
//    var messages = [JSQMessage]()
    var messages = [Message]()
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    var outgoingBubbleImageView : JSQMessagesBubbleImage!
    
    
    var user: FAuthData?
    
    var ref: Firebase!
    // *** STEP 1: STORE FIREBASE REFERENCES
    var messagesRef: Firebase!
    var senderImageUrl: String!
    var avatars = Dictionary<String, UIImage>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        inputToolbar.contentView.leftBarButtonItem = nil
        automaticallyScrollsToMostRecentMessage = true
        //navigationController?.navigationBar.topItem?.title = "Logout"
        
        
        setupBubble()
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        
       //messageRef = rootRef.childByAppendingPath("messages")
        
        senderId = (senderId != nil) ? senderId : "Anonymous"
        
        print("SENDER ID in ViewDidLoad", senderId)
        let profileImageUrl = user?.providerData["cachedUserProfile"]?["profile_image_url_https"] as? NSString
        
        
        if let urlString = profileImageUrl {
            setupAvatarImage(senderId, imageUrl: urlString as String, incoming: false)
            
          
            senderImageUrl = urlString as String
        } else {
            setupAvatarColor(senderId, incoming: false)
            senderImageUrl = ""
        }

        
        setupFirebase()

    }
    
    func setupFirebase() {
        // *** STEP 2: SETUP FIREBASE
        messagesRef = Firebase(url: "https://twitterloginforbutle.firebaseio.com/")
        
        // *** STEP 4: RECEIVE MESSAGES FROM FIREBASE (limited to latest 25 messages)
        messagesRef.queryLimitedToNumberOfChildren(25).observeEventType(FEventType.ChildAdded, withBlock: { (snapshot) in
            let text = snapshot.value["text"] as! String
            let sender = snapshot.value["senderId"] as! String
            
            print("SENDER ID in SETUPFIREBASE", sender)
            let imageUrl = snapshot.value["imageUrl"] as? String
            
            
            let message = Message(senderId: sender, senderDisplayName: sender, isMediaMessage: false, hash: 1, text: text)
            
            //let message = JSQMessage(senderId: sender, displayName: "komal", text: text)
            //let message = Message(text: text, sender: sender)
            self.messages.append(message)
            self.finishReceivingMessage()
        })
    }
    
    // STEP #
    func addMessage(id : String,text : String)
    {
        let message = JSQMessage(senderId: id, displayName: "", text: text)
        
        
        // let message = Message(text: text, sender: id, imageUrl: "")
        print("ID in Add msg", id)
       // messages.append(message)
    }
    
    
    func sendMessage(text: String!, sender: String!) {
        // *** STEP 3: ADD A MESSAGE TO FIREBASE
       //let itemRef =  messagesRef.childByAutoId().setValue([
//            "text":text,
//            "sender":sender,
//            "imageUrl":senderImageUrl
//            ])
        
        
        
        let itemRef = messagesRef.childByAutoId()
        
        let messageItem = [
            "text":text,
            "senderId":sender,
            "imageUrl":senderImageUrl
        ]
        itemRef.setValue(messageItem)
    }

    func tempSendMessage(text: String!, sender: String!)
    {
        let message = Message(senderId: sender, senderDisplayName: sender, isMediaMessage: false, hash: 1, text: text)
        
        //let message = JSQMessage(senderId: sender, displayName: "Komal", text: text)
        
        
        messages.append(message)
    }
    
    
    func setupAvatarImage(name: String, imageUrl: String?, incoming: Bool)
    {
        if let stringUrl = imageUrl
        {
            if let url = NSURL(string: stringUrl)
            {
                if let data = NSData(contentsOfURL: url)
                {
                    let image = UIImage(data: data)
                    let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
                    //let avatarImage = JSQMessagesAvatarFactory.avatarWithImage(image, diameter: diameter)
                    
                    //let avatarImage = JSQMessagesAvatarImageFactory.avatarImageWithImage(image, diameter: diameter)
                    //avatars[name] = avatarImage.avatarImage
                    return
                }
            }
        }
        
        // At some point, we failed at getting the image (probably broken URL), so default to avatarColor
        setupAvatarColor(name, incoming: incoming)
    }
    func setupAvatarColor(name: String, incoming: Bool) {
        let diameter = incoming ? UInt(collectionView.collectionViewLayout.incomingAvatarViewSize.width) : UInt(collectionView.collectionViewLayout.outgoingAvatarViewSize.width)
        
        let rgbValue = name.hash
        let r = CGFloat(Float((rgbValue & 0xFF0000) >> 16)/255.0)
        let g = CGFloat(Float((rgbValue & 0xFF00) >> 8)/255.0)
        let b = CGFloat(Float(rgbValue & 0xFF)/255.0)
        let color = UIColor(red: r, green: g, blue: b, alpha: 0.5)
        
        let nameLength = name.characters.count
        //let initials : String? = name.substringToIndex(sender.startIndex.advancedBy(min(3, nameLength)))
        
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout.springinessEnabled = true
        
        // observeMessages()
        // observeTyping()
    }
    
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        if ref != nil {
            ref.unauth()
        }
    }
    // ACTIONS
    
    func receivedMessagePressed(sender: UIBarButtonItem) {
        // Simulate reciving message
        showTypingIndicator = !showTypingIndicator
        scrollToBottomAnimated(true)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
//        let itemRef = messagesRef.childByAutoId() // 1
//        
//        print("Sender ID IN PRESSED",senderId)
//        
//        let messageItem = [ "text": text,"senderId": "komal"]
//        itemRef.setValue(messageItem) // 3
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
        sendMessage(text, sender: senderId)
        
        finishSendingMessage()
        
        
        
    }
    private func setupBubble()
    {
        let factory = JSQMessagesBubbleImageFactory()
        
        outgoingBubbleImageView = factory.outgoingMessagesBubbleImageWithColor(
            UIColor.jsq_messageBubbleBlueColor())
        incomingBubbleImageView = factory.incomingMessagesBubbleImageWithColor(
            UIColor.jsq_messageBubbleLightGrayColor())
    }
    
    
    
    private func observeMessages()
    {
        // 1
        let messagesQuery = messagesRef.queryLimitedToLast(25)
        // 2
        messagesQuery.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
            // 3
            let id = snapshot.value["senderId"] as! String
            let text = snapshot.value["text"] as! String
            print("ID in Observer",id)
            
            // 4
            self.addMessage(id, text: text)
            
            // self.addMessage("komal", text: text)
            
            
            // 5
            self.finishReceivingMessage()
        }
    }
    
    override func textViewDidChange(textView: UITextView)
    {
        super.textViewDidChange(textView)
        print(textView.text != "")
        
        // If the text is not empty, the user is typing
    }
    
//    private func observeTyping()
//    {
//       // let typingIndicatorRef = rootRef.childByAppendingPath("typingIndicator")
//        userIsTypingRef = typingIndicatorRef.childByAppendingPath(senderId)
//        userIsTypingRef.onDisconnectRemoveValue()
//        
//        userIsTypingRef = typingIndicatorRef.childByAppendingPath(senderId)
//        userIsTypingRef.onDisconnectRemoveValue()
//        
//        // 1
//        usersTypingQuery = typingIndicatorRef.queryOrderedByValue().queryEqualToValue(true)
//        
//        // 2
//        usersTypingQuery.observeEventType(.Value) { (data: FDataSnapshot!) in
//            
//            // 3 You're the only typing, don't show the indicator
//            if data.childrenCount == 1 && self.isTyping {
//                return
//            }
//            
//            // 4 Are there others typing?
//            self.showTypingIndicator = data.childrenCount > 0
//            self.scrollToBottomAnimated(true)
//        }
//    }
//    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        print("MESAGECOUNT", messages.count)
        return messages.count
    }
    
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
                                 messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
                                 messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource!
    {
        let message = messages[indexPath.item] // 1
        
       // print("message.senderId FROM DB",message.senderId)
        
        print("senderId",senderId)
        
        //if message.senderId != "komal"//senderId
        
        //if senderId != "komal"
        
        if message.senderId() == senderId
        {
            return outgoingBubbleImageView
        }
        else
        {
            return incomingBubbleImageView
        }
        
        return incomingBubbleImageView
    }
    
    

    
    // setting avatar null
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
                                 avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
   
    
    override func collectionView(collectionView: UICollectionView,
                                 cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
//        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
//            as! JSQMessagesCollectionViewCell
//        
//        let message = messages[indexPath.row]
//        
//         cell.textView.textColor =  UIColor.whiteColor()
//        
//        if message.senderId == "komal"//senderId //
//        {
//            cell.textView.textColor =  UIColor.whiteColor()
//        }
//        else
//        {
//            cell.textView.textColor =  UIColor.blackColor()
//        }
        
        
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        let message = messages[indexPath.item]
        //if message.senderID() == senderId
    
        if message.senderId() == senderId
        {
            cell.textView.textColor = UIColor.blackColor()
        } else
        {
            cell.textView.textColor = UIColor.whiteColor()
        }
        
        let attributes : [String:AnyObject] = [NSForegroundColorAttributeName:cell.textView.textColor!, NSUnderlineStyleAttributeName: 1]
        cell.textView.linkTextAttributes = attributes
        
        //        cell.textView.linkTextAttributes = [NSForegroundColorAttributeName: cell.textView.textColor,
        //            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle]
        return cell
    }
    
    // View  usernames above bubbles
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.item];
        
        // Sent by me, skip
        if message.senderId() == senderId {
            return nil;
        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messages[indexPath.item - 1];
            if previousMessage.senderId() == message.senderId() {
                return nil;
            }
        }
        
        return NSAttributedString(string:message.senderId())
    }

    
}
