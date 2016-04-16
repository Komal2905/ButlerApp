//
//  NotificationCell.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/14/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell
{

   
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pitchedLable: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var somelogo: UIButton!
    
    @IBAction func somelogopressed(sender: AnyObject)
    {
    }
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
