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

class ViewController: UIViewController, UITextViewDelegate, SaveExcerciseProtocol{
    
    func save(programName : String) {
        let myCode = textView.text
        self.programName = programName
        userDefaults.set(textView.text, forKey: "PROGRY-\(programName)")
        userDefaults.set(myCode, forKey: "PROGRY-\(programName)")
        navigationController?.popViewController(animated: true)
    }
    
  
    @IBOutlet weak var textView: UITextView!
    
    let pullUpController = SOPullUpControl()
    let userDefaults = UserDefaults.standard
    var programName = ""
    var new = true    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadProgram()
    }
    
    func loadProgram(){
        let code = UserDefaults.standard.string(forKey: "PROGRY-\(programName)")
        if programName == "" {
            new = true
        }else{
            textView.text = code
            new = false
        }
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
        pullUpController.dataSource = self
        pullUpController.setupCard(from: view)
        setUpTextView()
        
    }
    
    func setUpTextView(){
        textView.layer.masksToBounds = true
        textView.delegate = self

            // Set the font.
            textView.font = UIFont.systemFont(ofSize: 18)

            // Set font color.
            textView.textColor = UIColor.black

            // Set left justified.
            textView.textAlignment = NSTextAlignment.left

            // Make text uneditable.
            textView.isEditable = true    }
    
    
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
