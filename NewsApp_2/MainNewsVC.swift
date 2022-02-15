//
//  MainNewsVC.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 7/2/2565 BE.
//

import UIKit


extension MainNewsVC: NewsVCDelegate {
    func viewcontroller(_ vc: NewsVC, didClickRemoveButtonWith title: String) {
        removeNews(with: title)
    }
    
    func removeNews(with title: String) {
        if let index = news.firstIndex(where: { item in item.title == title }) {
            news.remove(at: index)
        }
    }
}

class MainNewsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var news = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func refreshButtonDidClick(_ sender: Any) {
        news = stubData
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsSegue",
           let newsVC = segue.destination as? NewsVC,
           let row = sender as? Int {
            newsVC.data = news[row]
            newsVC.delegate = self
            newsVC.onRemovedButtonDidClick = { [weak self] (title: String) -> () in
                self?.removeNews(with: title)
            }
        }
    }
    
    deinit {
        print("MainNewsVC deinit")
    }

}

