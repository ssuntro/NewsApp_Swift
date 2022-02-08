//
//  NewsVCViewController.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 8/2/2565 BE.
//

import UIKit

class NewsVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var calenderButton: UIButton!
    var data: News!
    override func viewDidLoad() {
        super.viewDidLoad()
        calenderButton.addTarget(self, action: #selector(calendarButtonDidClick), for: .touchUpInside)
        titleLabel.text = data.title
        bodyTextView.text = data.body
    }
    
    @objc func calendarButtonDidClick(_ sender: Any) {
        
    }
    
    @IBAction func forMoreDetailDidClick(_ sender: Any) {
    }
    @IBAction func removeButtonDidClick(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
