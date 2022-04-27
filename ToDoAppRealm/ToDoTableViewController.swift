//
//  ToDoTableViewController.swift
//  ToDoAppRealm
//
//  Created by Акбала Тлеугалиева on 4/27/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {
    let realm = try! Realm()

    var toDoList: Results<Task> {
          get {
            return realm.objects(Task.self)
          }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return toDoList.count
       }


       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           cell.textLabel?.text = toDoList[indexPath.row].taskName

           if toDoList[indexPath.row].isTaskCompleted{
               cell.accessoryType = .checkmark
           }
           else{
               cell.accessoryType = .none
           }
           return cell
       }
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoList[indexPath.row]
        try! self.realm.write({
        //item.isTaskCompleted = !item.isTaskCompleted
        item.isTaskCompleted.toggle()
        })
        tableView.reloadRows(at: [indexPath], with: .automatic)

       }
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
            let item = toDoList[indexPath.row]
            try! self.realm.write({
                self.realm.delete(item)
                })
               tableView.deleteRows(at: [indexPath], with: .fade)
           }
        }
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

