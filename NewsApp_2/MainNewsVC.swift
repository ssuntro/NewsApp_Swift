//
//  MainNewsVC.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 7/2/2565 BE.
//

import UIKit

extension MainNewsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = news[indexPath.row].title
        cell.badge.tintColor = news[indexPath.row].status.color
        cell.badge.backgroundColor = .clear
        cell.badge.setTitle(news[indexPath.row].status.rawValue, for: .normal)
        cell.thumbnailImageView.image = UIImage(named: news[indexPath.row].category.imageName)
        return cell
    }
}

extension MainNewsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


class MainNewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
//    let news = ["title1", "title2", "title3"]
    var news = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MainNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        news = stubData
    }
    
    deinit {
        print("MainNewsVC deinit")
    }

}

//recap - funFact UI attribute override lv scuh as bgColor/tineColor (storyboard, layoutsubView, cellForRow) using breakpoint
//recap - stubData + display
//IBoutlet life cycle

//see compile result
//

