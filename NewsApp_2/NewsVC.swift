//
//  NewsVCViewController.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 8/2/2565 BE.
//

import UIKit
import EventKit
import EventKitUI


extension NewsVC: EKEventViewDelegate {
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        dismiss(animated: true, completion: nil)
    }
}
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
        bodyTextView.isUserInteractionEnabled = false
    }
    
    let calendarStore = EKEventStore()
    @objc func calendarButtonDidClick(_ sender: Any) {
        calendarStore.requestAccess(to: .event,
                                    completion: xxxx)
    }
    
    func xxxx(status: Bool, error: Error?) {
        if status, error == nil {
            
    
            let newEvent = EKEvent(eventStore: self.calendarStore)
            newEvent.title = "AnnJa event"
            newEvent.startDate = Date()
            newEvent.endDate = Date()
            
            DispatchQueue.main.async {
                let vc = EKEventViewController()
                vc.event = newEvent
                vc.delegate = self
                let navVC = UINavigationController(rootViewController: vc)
                self.present(navVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func forMoreDetailDidClick(_ sender: Any) {
        
    }
    @IBAction func removeButtonDidClick(_ sender: Any) {
        
    }
    
    deinit {
        print("NewsVC deinit")
    }
}



//3. progress
