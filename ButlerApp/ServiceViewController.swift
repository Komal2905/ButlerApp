//
//  ServiceViewController.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/15/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
    
    var util  = Util()
    
    let colors = Colors()

    @IBOutlet weak var serviceSegment: UISegmentedControl!
    
    
    @IBOutlet weak var allServiceView: UIView!
    
    
    @IBOutlet weak var financeServiceView: UIView!
    
    @IBOutlet weak var cleaningServiceView: UIView!
    
    @IBOutlet weak var autoServiceView: UIView!
    
    @IBOutlet weak var sportServiceView: UIView!
    
    var toolBarArray = ["ALL","FINANCE","CLEANING", "AUTO","SPORT","NEW1","NEW2","NEW3"]
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        allServiceView.hidden = true
        financeServiceView.hidden = true
        cleaningServiceView.hidden = true
        autoServiceView.hidden = true
        sportServiceView.hidden = true
    }

    
    
    //var selected = false
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return toolBarArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let serviceCell = collectionView.dequeueReusableCellWithReuseIdentifier("serviceCell", forIndexPath: indexPath) as! CategoryCollectionViewCell
        
      serviceCell.serviceNameLabel.text = toolBarArray[indexPath.row]
     
        
        
        
        
        if serviceCell.selected
        {
            print("Cell Selected ")
        }
        
        else
        {
            print("Cell Not selected ")
        }
       
       // serviceCell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return serviceCell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    
  
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        var cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        var check = false
        
        
        if ((cell?.selected) != nil)
        {
            print("This is selected ")
        }
        if(indexPath.item == 0)
        {
            //cell!.backgroundColor = UIColor.orangeColor()
            allServiceView.hidden = false
            financeServiceView.hidden = true
            cleaningServiceView.hidden = true
            autoServiceView.hidden = true
            sportServiceView.hidden = true
            
            if(check == false)
            {
               // cell!.backgroundColor = UIColor.orangeColor()
                check = true
            }
        }
        
        if(indexPath.item == 1)
        {
            //cell!.backgroundColor = UIColor.orangeColor()
            allServiceView.hidden = true
            financeServiceView.hidden = false
            cleaningServiceView.hidden = true
            autoServiceView.hidden = true
            sportServiceView.hidden = true
            
        
            //cell!.backgroundColor = UIColor.orangeColor()
            
        }
        
        if(indexPath.item == 2)
        {
           // cell!.backgroundColor = UIColor.orangeColor()
            allServiceView.hidden = true
            financeServiceView.hidden = true
            cleaningServiceView.hidden = false
            autoServiceView.hidden = true
            sportServiceView.hidden = true
            
            //cell!.backgroundColor = UIColor.orangeColor()
               
        }

        
        
        if(indexPath.item == 3)
        {
            //cell!.backgroundColor = UIColor.orangeColor()
            allServiceView.hidden = true
            financeServiceView.hidden = true
            cleaningServiceView.hidden = true
            autoServiceView.hidden = false
            sportServiceView.hidden = true
            
            //cell!.backgroundColor = UIColor.orangeColor()
        }

        
        if(indexPath.item == 4)
        {
            //cell!.backgroundColor = UIColor.orangeColor()
            allServiceView.hidden = true
            financeServiceView.hidden = true
            cleaningServiceView.hidden = true
            autoServiceView.hidden = true
            sportServiceView.hidden = false
            //cell!.backgroundColor = UIColor.orangeColor()
        }

    }
    
    
    override func didReceiveMemoryWarning() {
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



class Colors {
    let colorTop = UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0).CGColor
    let colorBottom = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0).CGColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [ colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
}
}
