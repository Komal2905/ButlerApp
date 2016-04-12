//
//  DragableView.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//
import Foundation
import UIKit

let ACTION_MARGIN: Float = 120      //%%% distance from center where the action applies. Higher = swipe further in order for the action to be called
let SCALE_STRENGTH: Float = 4       //%%% how quickly the card shrinks. Higher = slower shrinking
let SCALE_MAX:Float = 0.93          //%%% upper bar for how much the card shrinks. Higher = shrinks less
let ROTATION_MAX: Float = 1         //%%% the maximum rotation allowed in radians.  Higher = card can keep rotating longer
let ROTATION_STRENGTH: Float = 320  //%%% strength of rotation. Higher = weaker rotation
let ROTATION_ANGLE: Float = 3.14/8  //%%% Higher = stronger rotation angle

protocol DraggableViewDelegate {
    func cardSwipedLeft(card: UIView) -> Void
    func cardSwipedRight(card: UIView) -> Void
}



class DraggableView: UIView {
    var delegate: DraggableViewDelegate!
    var panGestureRecognizer: UIPanGestureRecognizer!
    var originPoint: CGPoint!
    var overlayView: OverlayView!
    var QuestionLable: UILabel!
    var questionslable : UILabel!
    
  
    var option1 : UILabel!
    var option2 : UILabel!
    var option3 : UILabel!
    
    
    var button1 : UIButton!
    var button2 : UIButton!
    var button3 : UIButton!
    
    var Next : UIButton!
    
    
    var xFromCenter: Float!
    var yFromCenter: Float!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
        
        QuestionLable = UILabel(frame: CGRectMake(0, 0, self.frame.size.width, 100))
        QuestionLable.text = "no info given"
        QuestionLable.textAlignment = NSTextAlignment.Center
        QuestionLable.textColor = UIColor.blackColor()
        
        
        questionslable = UILabel(frame: CGRectMake(0, 50, self.frame.size.width, 100))
        questionslable.text = "When do you want to schedule your car cleaning"
        questionslable.numberOfLines = 3
        questionslable.textAlignment = NSTextAlignment.Center
        questionslable.textColor = UIColor.blackColor()
        
        
        option1 = UILabel(frame: CGRectMake(0, 190, self.frame.size.width, 20))
        
        
        option1.text = "This Weekend"
        option1.font = option1.font.fontWithSize(15)
        option1.textAlignment = NSTextAlignment.Center
        option1.textColor = UIColor.blackColor()
        
        option2 = UILabel(frame: CGRectMake(0, 210, self.frame.size.width, 20))
        option2.text = "As soon as possible"
        option2.font = option2.font.fontWithSize(15)
        option2.textAlignment = NSTextAlignment.Center
        option2.textColor = UIColor.blackColor()
        
        option3 = UILabel(frame: CGRectMake(0, 230, self.frame.size.width, 20))
        option3.text = "Call me to Schedule"
        option3.font = option3.font.fontWithSize(15)
        option3.textAlignment = NSTextAlignment.Center
        option3.textColor = UIColor.blackColor()
        
        button1 = UIButton(frame: CGRectMake(20, 190, 20, 20))
        button1.layer.borderWidth = 1.0
        button1.setTitle("", forState: UIControlState.Normal)
        button1.addTarget(self, action: #selector(DraggableView.buttonAction(_:)), forControlEvents: .TouchUpInside)
        
        
        button2 = UIButton(frame: CGRectMake(20, 210, 20, 20))
        button2.layer.borderWidth = 1.0
        button2.setTitle("", forState: UIControlState.Normal)
        button2.addTarget(self, action: #selector(DraggableView.buttonAction(_:)), forControlEvents: .TouchUpInside)
        
        
        
        
        button3 = UIButton(frame: CGRectMake(20, 230, 20, 20))
        button3.layer.borderWidth = 1.0
        button3.setTitle("", forState: UIControlState.Normal)
        button3.addTarget(self, action: #selector(DraggableView.buttonAction(_:)), forControlEvents: .TouchUpInside)
        
        
        
        Next = UIButton(frame: CGRectMake(20, 300, 50, 20)) 
        Next.layer.borderWidth = 1.0
        Next.layer.borderColor = UIColor.redColor().CGColor
        Next.setTitle("NEXT", forState: UIControlState.Normal)
        Next.addTarget(self, action: #selector(DraggableView.swipeRight), forControlEvents: UIControlEvents.TouchUpInside)
        self.backgroundColor = UIColor.lightGrayColor()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DraggableView.beingDragged(_:)))
        
        self.addGestureRecognizer(panGestureRecognizer)
        
        
        
        self.addSubview(QuestionLable)
        
         self.addSubview(questionslable)
         self.addSubview(option1)
         self.addSubview(option2)
         self.addSubview(option3)
        
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        
        //self.addSubview(Next)
        
        overlayView = OverlayView(frame: CGRectMake(self.frame.size.width/2-100, 0, 100, 100))
        overlayView.alpha = 0
        self.addSubview(overlayView)
        
        xFromCenter = 0
        yFromCenter = 0
    }
    
    func setupView() -> Void {
        self.layer.cornerRadius = 4;
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowOffset = CGSizeMake(1, 1);
    }
    
    func beingDragged(gestureRecognizer: UIPanGestureRecognizer) -> Void {
        xFromCenter = Float(gestureRecognizer.translationInView(self).x)
        yFromCenter = Float(gestureRecognizer.translationInView(self).y)
        
        switch gestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            self.originPoint = self.center
        case UIGestureRecognizerState.Changed:
            let rotationStrength: Float = min(xFromCenter/ROTATION_STRENGTH, ROTATION_MAX)
            let rotationAngle = ROTATION_ANGLE * rotationStrength
            let scale = max(1 - fabsf(rotationStrength) / SCALE_STRENGTH, SCALE_MAX)
            
            self.center = CGPointMake(self.originPoint.x + CGFloat(xFromCenter), self.originPoint.y + CGFloat(yFromCenter))
            
            let transform = CGAffineTransformMakeRotation(CGFloat(rotationAngle))
            let scaleTransform = CGAffineTransformScale(transform, CGFloat(scale), CGFloat(scale))
            self.transform = scaleTransform
            self.updateOverlay(CGFloat(xFromCenter))
        case UIGestureRecognizerState.Ended:
            self.afterSwipeAction()
        case UIGestureRecognizerState.Possible:
            fallthrough
        case UIGestureRecognizerState.Cancelled:
            fallthrough
        case UIGestureRecognizerState.Failed:
            fallthrough
        default:
            break
        }
    }
    
    func updateOverlay(distance: CGFloat) -> Void {
        if distance > 0 {
            overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeRight)
        } else {
            overlayView.setMode(GGOverlayViewMode.GGOverlayViewModeLeft)
        }
        overlayView.alpha = CGFloat(min(fabsf(Float(distance))/100, 0.4))
    }
    
    func afterSwipeAction() -> Void {
        let floatXFromCenter = Float(xFromCenter)
        if floatXFromCenter > ACTION_MARGIN {
            self.rightAction()
        } else if floatXFromCenter < -ACTION_MARGIN {
            self.leftAction()
        } else {
            UIView.animateWithDuration(0.3, animations: {() -> Void in
                self.center = self.originPoint
                self.transform = CGAffineTransformMakeRotation(0)
                self.overlayView.alpha = 0
            })
        }
    }
    
    func rightAction() -> Void {
        let finishPoint: CGPoint = CGPointMake(500, 2 * CGFloat(yFromCenter) + self.originPoint.y)
        UIView.animateWithDuration(0.3,
                                   animations: {
                                    self.center = finishPoint
            }, completion: nil/*{
                (value: Bool) in
                self.removeFromSuperview()
                //true
        }*/)
        delegate.cardSwipedRight(self)
    }
    
    func leftAction() -> Void {
        let finishPoint: CGPoint = CGPointMake(-500, 2 * CGFloat(yFromCenter) + self.originPoint.y)
        UIView.animateWithDuration(0.3,
                                   animations: {
                                    self.center = finishPoint
            }, completion: nil/*{
                (value: Bool) in
                //self.removeFromSuperview()
                true
        }*/)
        
        
//        UIView.animateWithDuration(0.3, animations:{
//            self.center = finishPoint
//            self.transform = CGAffineTransformMakeRotation(1)
//        })
        delegate.cardSwipedLeft(self)
    }
    
    func rightClickAction() -> Void {
        let finishPoint = CGPointMake(600, self.center.y)
        UIView.animateWithDuration(0.3,
                                   animations: {
                                    self.center = finishPoint
                                    self.transform = CGAffineTransformMakeRotation(1)
            }, completion: nil /*{
                (value: Bool) in
                
                //true
                self.removeFromSuperview()
        } */)
 
       
        delegate.cardSwipedRight(self)
    }
    
    func leftClickAction() -> Void {
        
         print("6")
        let finishPoint: CGPoint = CGPointMake(0, self.center.y)
        
         self.transform = CGAffineTransformMakeRotation(1)
        UIView.animateWithDuration(0.3,
                                   animations: {
                                    //self.center = finishPoint
                                    
                                    self.center.x = 155
                                    self.center.y = 290
                                    self.transform = CGAffineTransformMakeRotation(0)
                                    
                                     print("7")
            }, completion: nil
                
                /*
                {
                (value: Bool) in
         
                 print("8")
                true
               self.removeFromSuperview()
               
        }*/)
        
         print("9")
        delegate.cardSwipedLeft(self)
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button preseed")
    }
    
    func swipeRight() -> Void {
        
        print("NEXT Button")
        
        for var cCount = 0; cCount <= 5; cCount = cCount+1
        {
            print("CCOunt In Next", cCount)
            if (cCount == 4)
            {
                Next.enabled = false
                break
            }
                
            else
            {
                Next.enabled = true
            }
        }


    }
}