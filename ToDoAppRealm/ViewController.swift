//
//  ViewController.swift
//  ToDoAppRealm
//
//  Created by Акбала Тлеугалиева on 4/27/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    func configureViews() {
             textField.layer.cornerRadius = 12.0
             textField.layer.borderWidth = 1.0
             saveButton.layer.cornerRadius = 12.0
         }
    
    @IBAction func textFieldEdiitngBegin(_ sender: TextFieldWithPadding) {
        sender.layer.borderColor = UIColor(red: 1.00, green: 0.55, blue: 0.00, alpha: 1.00).cgColor
    }
    
    @IBAction func textFieldDidEditingEnd(_ sender: TextFieldWithPadding) {
        
     sender.layer.borderColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 1.00).cgColor
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @IBAction func addNewTask(_ sender: Any) {
        let newTask = Task()
        newTask.taskName = textField.text!
        newTask.isTaskCompleted = false
        
        try! self.realm.write({
            self.realm.add(newTask)
        })
        textField.text = " "
    }
}


