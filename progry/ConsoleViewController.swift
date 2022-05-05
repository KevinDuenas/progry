//
//  ConsoleViewController.swift
//  progry
//
//  Created by Kevin Duenas on 22/04/22.
//

import UIKit
import SOPullUpView

class ConsoleViewController: UIViewController {
    
    @IBOutlet weak var handleView: UIView!
    
    var pullUpControl: SOPullUpControl? {
        didSet {
            pullUpControl?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}


extension ConsoleViewController: SOPullUpViewDelegate {
    
    
    func pullUpViewStatus(didChangeTo status: PullUpStatus) {
        switch status {
        case .collapsed: break
        case .expanded: break
       }
    }
    
    func pullUpViewStatus(_ sender: UIViewController, didChangeTo status: PullUpStatus) {
        
    }
    
   
    
    func pullUpHandleArea(_ sender: UIViewController) -> UIView {
        return handleView
    }
}

