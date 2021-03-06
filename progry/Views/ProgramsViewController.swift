//
//  ProgramsViewController.swift
//  progry
//
//  Created by Kevin Duenas on 28/05/22.
//

import UIKit

class ProgramsViewController: UIViewController {

    @IBOutlet weak var programsTableView: UITableView!
    @IBOutlet weak var btnNew: UIBarButtonItem!
    
    var programs = [String]()
    var selectedProgram = ""
    var showExamples = false
    var selectedExample : Int?
    var examplePrograms = ExamplePrograms()
    //["Modules","Variables", "Ciclo While", "Condicional If", "Ciclo For", "Find on array", "Multi mat", "Find on matrix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        programsTableView.delegate = self
        programsTableView.dataSource = self
        if showExamples {
            loadExamples()
            btnNew.isEnabled = false
        }else{
            getPrograms()
        }
        

    }
    
}

extension ProgramsViewController {
    
    @IBAction func newProgram(_ sender: Any) {
        selectedProgram = ""
        performSegue(withIdentifier: "showProgram", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProgram" {
            let vc = segue.destination as! ViewController
            vc.programName = selectedProgram
            if showExamples {
                vc.exampleIndex = selectedExample
            }else{
                vc.programName = selectedProgram
            }
        }

    }
    
    func getPrograms(){
        
        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        for key in keys {
            if key.contains("PROGRY-"){
                let removePrefix = key.replacingOccurrences(of: "PROGRY-", with: "")
                programs.append(removePrefix)
                programsTableView.reloadData()
            }
        }
    }
    
    func loadExamples() {
        
        for program in examplePrograms.programs {
            print("entra", program)
            programs.append(program.name)
        }
    }
    
    func deleteProgram(index : Int){
        print("deleting")
        var name = programs[index]
        name = "PROGRY-\(name)"
        UserDefaults.standard.removeObject(forKey: name)
        
    }
}

extension ProgramsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programCell", for: indexPath) as! ProgramTableViewCell
        cell.lblTitle.text = programs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProgram = programs[indexPath.row]
        selectedExample = indexPath.row
        performSegue(withIdentifier: "showProgram", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete Program"
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            programsTableView.beginUpdates()
            deleteProgram(index: indexPath.row)
            programs.remove(at: indexPath.row)
            programsTableView.deleteRows(at: [indexPath], with: .fade)
            programsTableView.endUpdates()
        }
    }
    
    
}
