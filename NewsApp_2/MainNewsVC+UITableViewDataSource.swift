//
//  MainNewsVC+UITableViewDataSource.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 14/2/2565 BE.
//

import Foundation
import UIKit

extension MainNewsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = news[indexPath.row].detail.title
        cell.badge.tintColor = news[indexPath.row].detail.status.color
        cell.badge.backgroundColor = .clear
        cell.badge.setTitle(news[indexPath.row].detail.status.rawValue, for: .normal)
        cell.thumbnailImageView.image = UIImage(named: news[indexPath.row].category.imageName)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newsSegue", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        
        UIApplication.shared.setAlternateIconName(indexPath.row % 2 == 0 ? "jp-icon": "thai-icon")
    }
}
