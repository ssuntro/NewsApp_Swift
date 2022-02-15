//
//  NewsVCViewController.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 8/2/2565 BE.
//

import UIKit
import EventKit
import EventKitUI

protocol NewsVCDelegate: AnyObject {
    func viewcontroller(_ vc: NewsVC, didClickRemoveButtonWith title: String)
}


extension NewsVC: EKEventViewDelegate {
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        dismiss(animated: true, completion: nil)
    }
}


//class AnnJa {
//    var a: UIViewController
//    init(vc: UIViewController) { a = vc }
//}

class NewsVC: UIViewController {
//    lazy var aaaaa = AnnJa(vc: self)
    var onRemovedButtonDidClick: ((_ selectedTitle: String) ->Void)?
    weak var delegate: NewsVCDelegate?
    
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
//        let _ = aaaaa.a
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
        openBrowser()
    }
    
    @IBAction func removeButtonDidClick(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
//            self.delegate?.viewcontroller(self, didClickRemoveButtonWith: self.data.title)
            self.onRemovedButtonDidClick?(self.data.title)
        }
    }
    func openBrowser() {
        guard let url = URL(string: data.url), UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    deinit {
        print("NewsVC deinit")
    }
}



//    func jumpToInstragram() {
//        let appURL = URL(string: "fb://profile/555")!
//        if UIApplication.shared.canOpenURL(appURL) {
//            UIApplication.shared.open(appURL)
//        } else {
//            //jump to store
//            if let storeURL = URL(string: "itms-apps://apple.com/app/id389801252") {
//                UIApplication.shared.open(storeURL)
//            }
//        }
//    }
