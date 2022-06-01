//
//  ReadPopUpViewController.swift
//  progry
//
//  Created by Kevin Duenas on 30/05/22.
//

import UIKit

class ReadPopUpViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
    }
    

    @IBAction func returnValue(_ sender: Any) {
        
        
    
        
    }
    

}

extension ReadPopUpViewController {
    
    static func presentPopUp(parentVC: UIViewController){
        
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReadPopUps") as? ReadPopUpViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            
            //popupViewController.saveDelegate = parentVC as? ViewController
            parentVC.present(popupViewController, animated: true)
            
        }
        
       
    }
    
    
    static let newTask = Task {  () -> String in
        
        print("entra al new task")
        await Task.sleep(UInt64(1000))
        
        print("despues de 10 segundos")
        
        return  "text";
        
        
        
    }
    
    

}
