//
//  ServiceCell.swift
//  ButlerApp
//
//  Created by ProjectHeena on 4/15/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ServiceCell: UITableViewCell
{
    @IBOutlet weak var serviceBackgroundImage: UIImageView!

    @IBOutlet weak var serviceSubLable: UILabel!
    @IBOutlet weak var serviceNameLabel: UILabel!
    
    @IBOutlet weak var availImageView: UIImageView!
    
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
