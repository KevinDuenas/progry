//
//  PopUpsViewController.swift
//  progry
//
//  Created by Kevin Duenas on 28/05/22.
//

import UIKit

class PopUpsViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    var saveDelegate : SaveExcerciseProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    @IBAction func touch(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        saveDelegate?.save(programName: tfName.text ?? "New Program")
        dismiss(animated: false, completion: nil)
    }

}

extension PopUpsViewController {
    
    static func presentPopUp(parentVC: UIViewController){
        
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUps") as? PopUpsViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            
            popupViewController.saveDelegate = parentVC as? ViewController
            parentVC.present(popupViewController, animated: true)
            
        }
        
       
    }

}
