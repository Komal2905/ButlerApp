//
//  SideBarProfileCell.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/13/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//
// Purpose : Custome File For Side bar profile Pic

import UIKit

class SideBarProfileCell: UITableViewCell {

    @IBOutlet weak var profilePicImageView: UIImageView!
    
    
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var menuOption: UILabel!
    
    
    @IBOutlet weak var subOption: UILabel!
    
    
    @IBOutlet weak var optionLogoImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
