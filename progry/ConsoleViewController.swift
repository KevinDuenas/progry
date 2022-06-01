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
    
    var delegate : RunProgramProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    var commands = [String]()
    var parentVC : UIViewController?
    
    var pullUpControl: SOPullUpControl? {
        didSet {
            pullUpControl?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
    }
    
    func setupViews(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = nil
        tableView.backgroundColor = UIColor.clear
        let vc = parentVC as! ViewController
        
        vc.delegate = self
        
    }
    
    @IBAction func runProgram(_ sender: Any)  {
         delegate?.run()
    }
    
}

extension ConsoleViewController {
    
}

extension ConsoleViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "printCell", for: indexPath) as! ConsoleTableViewCell
        cell.lblTitle.text = commands[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
    
    
}

extension ConsoleViewController : UpdateCommandsProtocol{
    func update(cmds: [String]) {
        commands = cmds
        tableView.reloadData()
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

