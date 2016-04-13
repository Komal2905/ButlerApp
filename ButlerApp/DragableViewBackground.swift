//
//  DragableViewBackground.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//


import Foundation
import UIKit

class DraggableViewBackground: UIView, DraggableViewDelegate {
    var exampleCardLabels: [String]!
    var allCards: [DraggableView]!
    
    let MAX_BUFFER_SIZE = 2
    let CARD_HEIGHT: CGFloat = 386
    let CARD_WIDTH: CGFloat = 290
    
    var cardsLoadedIndex: Int!
    var loadedCards: [DraggableView]!
    var menuButton: UIButton!
    var messageButton: UIButton!
    
    
    var nextButton: UIButton!
    var preButton: UIButton!
    
    
    var b1 :  UIButton!
    var b2 :  UIButton!
    
    var checkNext = 0
    var checkPrev = 0
    
    var checkP = 0
    var isNext = false
    
    var draggableView : DraggableView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        self.setupView()
        exampleCardLabels = ["Question 1 out 5", "Question 2 out 5", "Question 3 out 5", "Question 4 out 5", "Question 5 out 5"]
        allCards = []
        loadedCards = []
        cardsLoadedIndex = 0
        self.loadCards()
    }
    
    func setupView() -> Void {
        self.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1)
        
        preButton = UIButton(frame: CGRectMake((self.frame.size.width - CARD_WIDTH)/2+10 , self.frame.size.height/2 + CARD_HEIGHT/2 + 10, 80, 40))
        
        preButton.setTitle("Prev", forState: UIControlState.Normal)
        preButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        preButton.backgroundColor = UIColor.blackColor()
        preButton.layer.cornerRadius = 15
        preButton.layer.borderWidth = 1
        preButton.layer.borderColor = UIColor.blackColor().CGColor
       
        //preButton.setImage(UIImage(named: "xButton"), forState: UIControlState.Normal)
        preButton.addTarget(self, action: #selector(DraggableViewBackground.swipeLeft), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        nextButton = UIButton(frame: CGRectMake(self.frame.size.width/2 + CARD_WIDTH/2 - 85, self.frame.size.height/2 + CARD_HEIGHT/2 + 10, 80, 40))
       // nextButton.setImage(UIImage(named: "checkButton"), forState: UIControlState.Normal)
        
        nextButton.setTitle("Next", forState: UIControlState.Normal)
        nextButton.addTarget(self, action: #selector(DraggableViewBackground.swipeRight), forControlEvents: UIControlEvents.TouchUpInside)
        
        nextButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        nextButton.backgroundColor = UIColor.blackColor()
        nextButton.layer.cornerRadius = 15
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.blackColor().CGColor
        
        preButton.enabled = false
        preButton.hidden = true
        
        
        self.addSubview(preButton)
        self.addSubview(nextButton)
    }
    
    
    //create views
    func createDraggableViewWithDataAtIndex(index: NSInteger) -> DraggableView {
         draggableView = DraggableView(frame: CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/2, CARD_WIDTH, CARD_HEIGHT))
        
        draggableView.QuestionLable.text = exampleCardLabels[index]
        draggableView.delegate = self
        return draggableView
    }
    
    func loadCards() -> Void {
        if exampleCardLabels.count > 0
        {
            let numLoadedCardsCap = exampleCardLabels.count > MAX_BUFFER_SIZE ? exampleCardLabels.count : exampleCardLabels.count//expected 2 here
            
            for i in 0 ..< exampleCardLabels.count
            {
                let newCard: DraggableView = self.createDraggableViewWithDataAtIndex(i)
                allCards.append(newCard)
                if i < numLoadedCardsCap
                {
                    loadedCards.append(newCard)//expected 2 here
                }
             
            }
            
        print("All Cards",allCards.count)
        print("Loaded card Count",loadedCards.count )
            
            
            for i in 0 ..< loadedCards.count
            {
                if i > 0
                {
                    self.insertSubview(loadedCards[i], belowSubview: loadedCards[i - 1])
                
                }
                else
                {
                    self.addSubview(loadedCards[i])
                }
                cardsLoadedIndex = cardsLoadedIndex + 1
                
                print("CardLoaded Index", cardsLoadedIndex)
           
            
            }
        }
      
    }
    
    
// delegate protocols
    
    func cardSwipedLeft(card: UIView) -> Void {
        //loadedCards.removeAtIndex(0)
        if (isNext)
        {
            print("THIS IS NEXT")
            
          // self.draggableView.hidden = true
        }
        
        else
        {
            draggableView.hidden = true
        
            print("10")
            if (loadedCards.count == 0)
            {
            
           
                print("Loadedc cards is 0")
            
                //preButton.enabled = false
            }
            print("11")
        
        
            print("Loaded card COunt IN LEFT",loadedCards.count)
            print("allCards.count IN LEFT",allCards.count)
            print("cardsLoadedIndex COunt IN LEFT",cardsLoadedIndex)
        
        
            print("MAX_BUFFER_SIZE - 2",MAX_BUFFER_SIZE - 2)
            self.insertSubview(loadedCards[MAX_BUFFER_SIZE - 1], belowSubview: loadedCards[MAX_BUFFER_SIZE - 2])
        
            // self.insertSubview(loadedCards[3], belowSubview: loadedCards[4])
        
        
        
            /*
             if cardsLoadedIndex < allCards.count {
            
             print("12")
             loadedCards.append(allCards[cardsLoadedIndex-1])
             //cardsLoadedIndex = cardsLoadedIndex + 1
             self.insertSubview(loadedCards[MAX_BUFFER_SIZE - 1], belowSubview: loadedCards[MAX_BUFFER_SIZE - 2])
             }*/
            
        }
}
    
    // delegate protocol
    
    func cardSwipedRight(card: UIView) -> Void {
        //loadedCards.removeAtIndex(0)
        
        
        print("Loaded card COunt IN RIGHT",loadedCards.count)
        self.insertSubview(loadedCards[MAX_BUFFER_SIZE - 1], belowSubview: loadedCards[MAX_BUFFER_SIZE - 2])
        
        /*
        if cardsLoadedIndex < allCards.count
        {
            loadedCards.append(allCards[cardsLoadedIndex])
            cardsLoadedIndex = cardsLoadedIndex + 1
            self.insertSubview(loadedCards[MAX_BUFFER_SIZE - 1], belowSubview: loadedCards[MAX_BUFFER_SIZE - 2])
        }*/
    }
  
    
var loadCardLeft = 0
func swipeLeft() -> Void
{
    
    isNext = true
    print("Prev Button")
    checkP = checkP - 1
    print("Check p in Left ",checkP)
        
    if(checkP < 0)
    {
        preButton.enabled = false
            
        preButton.hidden = true
            
    }
        
    else
    {
        nextButton.enabled = true
        nextButton.hidden = false
    }
    
    
    if loadedCards.count <= 0
    {
            
        //preButton.enabled = false
        return
    }
    

    var dragView :  DraggableView = loadedCards[checkP]
    
    if(checkP == 0)
    {
        //dragView = loadedCards[0]
        preButton.enabled = false
        
        preButton.hidden = true
    }
//    else
//    {
//        dragView  = loadedCards[checkP]
//    }
    
    loadCardLeft = loadCardLeft + 1
    
    dragView.overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeLeft)
        
   
    UIView.animateWithDuration(0.2, animations: {
        () -> Void in
            
       
        dragView.overlayView.alpha = 1
        })
        
    
        dragView.leftClickAction()
    }
    
    
    
var isCheck = false
var loadCard = 0
    
    
func swipeRight() -> Void
{
        
    preButton.hidden = false
    preButton.enabled = true
    
    checkP = checkP + 1
    //disable next button
    if (checkP == 4)
    {
        nextButton.enabled = false
        nextButton.hidden = true
    }
    else
    {
        nextButton.enabled = true
        nextButton.hidden = false
    }
        
       
    if loadedCards.count <= 0 {
            
        //nextButton.enabled = false
        return
    }
    
    
    print("Load cards in Right",loadCard )
    let dragView: DraggableView = loadedCards[loadCard]
    
    if (loadCard == 4)
    {
         //dragView = loadedCards[4]
        
        loadCard = 0
    }
//    else
//    {
//       dragView = loadedCards[loadCard]
//    }
        //let dragView: DraggableView = loadedCards[loadCard]
        
        loadCard = loadCard + 1
        dragView.overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeRight)
        UIView.animateWithDuration(0.2, animations: {
            () -> Void in
            dragView.overlayView.alpha = 1
        })
        dragView.rightClickAction()
    }
    

}