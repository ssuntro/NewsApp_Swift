//
//  ViewController.swift
//  NewsApp_2
//
//  Created by Siroratt Suntronsuk on 7/2/2565 BE.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemPurple
        animateDinosaur()
        
        //navigate after 5 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            print("after 5 seconds")
            
            let demoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainNewsVC") as! MainNewsVC
            //UIViewController()
//            demoVC.view.backgroundColor = .systemCyan
            
            //option1
//            demoVC.modalPresentationStyle = .pageSheet
//            self?.present(demoVC, animated: true, completion: nil)
            
            //option2
            guard let window = self?.view.window else { return }
            window.rootViewController = demoVC
            window.makeKeyAndVisible()
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }
    
    deinit {
        print("SplashViewController deinit")
    }
    
    func animateDinosaur() {
        //setup Animation
        let animationView = AnimationView()
        let path = Bundle.main.path(forResource: "dino", ofType: "json") ?? ""
        animationView.animation = Animation.filepath(path)
        animationView.frame = view.bounds
        animationView.animationSpeed = 0.5
        
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        
        view.addSubview(animationView)
        view.bringSubviewToFront(animationView)
        animationView.play()
    }
}


