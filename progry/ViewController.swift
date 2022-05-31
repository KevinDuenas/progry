//
//  ViewController.swift
//  progry
//
//  Created by Kevin Duenas on 13/04/22.
//

import UIKit
import SOPullUpView

protocol SaveExcerciseProtocol {
    func save(programName: String)
}

protocol RunProgramProtocol {
    func run()
}

protocol UpdateCommandsProtocol{
    func update(cmds : [String])
}

class ViewController: UIViewController, UITextViewDelegate{

    
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    let variablesCode = """
    PROGRAM_START;
    
    var number myAge;
    var decimal myHeight;
    var text myName;
    var flag imSick;
    
    main {
        myHeight = 1.82;
        write("Mi estatura es de ", myHeight);
    
    }
    
    PROGRAM_END;
    """
    
    let whileCode = """
    PROGRAM_START;
    
        var decimal limit;
    
    main {
        limit = 1.0;
    
        while (limit < 6) do {
            write("Entra");
            limit = limit + 1.0;
        }
    
        if (limit > 4) {
            write("entro al if");
        }
        
    
    }
    
    PROGRAM_END;
    """

    let pullUpController = SOPullUpControl()
    let userDefaults = UserDefaults.standard
    var programName = ""
    var new = true
    var exampleIndex : Int?
    var delegate : UpdateCommandsProtocol?
    var commands = [String]()
    var codePrograms = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    func clearCommandView(){
        commands = []
        delegate?.update(cmds: commands)
    }
    
    func addComand(cmd: String){
        commands.append(cmd)
        delegate?.update(cmds: commands)
    }
    
    @IBAction func saveCode(_ sender: Any) {
        let myCode = textView.text
        if new {
            PopUpsViewController.presentPopUp(parentVC: self)
        }else{
            userDefaults.set(myCode, forKey: "PROGRY-\(programName)")
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    func setupViews(){
        codePrograms.append(variablesCode)
        codePrograms.append(whileCode)
        pullUpController.dataSource = self
        pullUpController.setupCard(from: view)
        setUpTextView()
        loadProgram()
    }
    
    func loadProgram(){
        
        if exampleIndex == nil {
            let code = UserDefaults.standard.string(forKey: "PROGRY-\(programName)")
            if programName == "" {
                new = true
            }else{
                textView.text = code
                new = false
            }
        }else{
            textView.text = codePrograms[exampleIndex!]
            btnSave.isEnabled = false
        }
        
    }
    
    func setUpTextView(){
        textView.layer.masksToBounds = true
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = UIColor.black
        textView.textAlignment = NSTextAlignment.left
        textView.isEditable = true
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        textView.endEditing(true)
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        //textView.attributedText = textView.text.setColorToChar(["module", "var", "hola"], color: [.red, .blue, .orange])
    }
    
    private func transform(_ input: String) -> String {
        let interpreter = Interpreter()
        let result = interpreter.evaluate(input)
        
        
    
        
        switch result {
        case .success(let value):
            print("success")
            return "\(value)"
        case .failure:
            print("failure")
            return ""
        }
    }
    
    
    
}

extension ViewController : SOPullUpViewDataSource {
    func pullUpViewStartViewHeight() -> CGFloat {
        return  300.0
    }
    func pullUpViewCollapsedViewHeight() -> CGFloat {
        return  300.0
    }
    func pullUpViewExpandedViewHeight() -> CGFloat {
        return 800.0
    }
    
    @objc func pullUpViewController() -> UIViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "console") as? ConsoleViewController else {return UIViewController()}
        vc.pullUpControl = self.pullUpController
        vc.delegate = self
        vc.parentVC = self
        return vc
    }
}


extension String {
    func getRanges(of string: String) -> [NSRange] {
        var ranges:[NSRange] = []
        if contains(string) {
            let words = self.components(separatedBy: " ")
            var position:Int = 0
            for word in words {
                if word.lowercased() == string.lowercased() {
                    let startIndex = position
                    let endIndex = word.count
                    let range = NSMakeRange(startIndex, endIndex)
                    ranges.append(range)
                }
                position += (word.count + 1)
            }
        }
        return ranges
    }
    func setColorToChar(_ chars: [String] , color: [UIColor]) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        if chars.count != color.count {
            fatalError("Colors are not added correctly")
        }
        
        //   let ranges = getRanges(of: char)
        for i in 0..<chars.count {
            let ranges = getRanges(of: chars[i])
            for range in ranges {
                attributedString.addAttributes([NSAttributedString.Key.foregroundColor: color[i]], range: range)
            }
        }
        
        return attributedString
    }
}

extension ViewController : RunProgramProtocol{
    func run() {
        transform(textView.text)
    }
    
    
}

extension ViewController :  SaveExcerciseProtocol {
    func save(programName : String) {
        let myCode = textView.text
        self.programName = programName
        userDefaults.set(textView.text, forKey: "PROGRY-\(programName)")
        userDefaults.set(myCode, forKey: "PROGRY-\(programName)")
        navigationController?.popViewController(animated: true)
    }
    
}

