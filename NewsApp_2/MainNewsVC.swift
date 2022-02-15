//
//  MainNewsVC.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 7/2/2565 BE.
//

import UIKit
import SwiftUI


extension MainNewsVC: NewsVCDelegate {
    func viewcontroller(_ vc: NewsVC, didClickRemoveButtonWith title: String) {
        removeNews(with: title)
    }
    
    func removeNews(with title: String) {
        if let index = news.firstIndex(where: { item in item.detail.title == title }) {
            news.remove(at: index)
        }
    }
}

class MainNewsVC: UIViewController {
    var network = NewsFetcher()
    var news = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func loginButtonDidClick(_ sender: Any) {
        let vc = UIHostingController(rootView: LoginView())
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MainNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        
        fetchData()

    }
    
    func fetchData() {
        network.exe { [weak self] result in
            self?.news = result
        }
//        print("1: Before task block")
//        Task { [weak self] in
//            let newsArray = await NewsFetcherAwait().task.result
//            print("4: fetchData fetchDatafetchDatafetchDatafetchData")
//        }
//        print("2: After task block")
        
    }
    
    @IBAction func refreshButtonDidClick(_ sender: Any) {
        fetchData()
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

