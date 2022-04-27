//
//  Task.swift
//  ToDoAppRealm
//
//  Created by Акбала Тлеугалиева on 4/27/22.
//  Copyright © 2022 Akbala Tleugaliyeva. All rights reserved.
//

import Foundation
import RealmSwift
class Task: Object {
    @objc dynamic var taskName: String = ""
    @objc dynamic var isTaskCompleted: Bool = false
    
    override init() {
           
       }
}
