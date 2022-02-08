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
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        badge.layer.cornerRadius = badge.frame.size.height/2
        badge.clipsToBounds = true //marksToBounds
    }
    
    //layoutSubviews, storyboard.cell.bgColor
    //cellForRow.tintColor
    
    

}
