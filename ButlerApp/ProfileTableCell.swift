//
//  ProfileTableCell.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ProfileTableCell: UITableViewCell {

    @IBOutlet weak var profilePicImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var contactMeButton: UIButton!
    
    @IBOutlet weak var sendMessageButton: UIButton!
    
    @IBOutlet weak var addFavouriteButton : UIButton!
    
    @IBOutlet weak var testimonialsImageView: UIImageView!
    
     @IBOutlet weak var userProfileSegment: UISegmentedControl!
    
    
    
    
    // for testimonial ContainerView
    
    @IBOutlet weak var testmonialsProfilePic: UIImageView!
    
    var check = false
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if(check == false)
        {
        
            
            check = true
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
