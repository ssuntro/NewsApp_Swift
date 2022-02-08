//
//  NewsTableViewCell.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 7/2/2565 BE.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var badge: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        badge.layer.cornerRadius = badge.frame.size.height/2
        badge.clipsToBounds = true //marksToBounds
    }
    
    
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
