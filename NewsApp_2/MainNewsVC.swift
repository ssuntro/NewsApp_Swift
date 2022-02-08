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
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let elem = news.remove(at: sourceIndexPath.row)
        news.insert(elem, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}


class MainNewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
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
    
    @IBAction func reOrderButtonDidClick(_ sender: Any) {
        print("reorder button จ้า")
        tableView.isEditing = !tableView.isEditing
    }
    
    
    deinit {
        print("MainNewsVC deinit")
    }

}

