//
//  NoteModelObj.swift
//  ToDoApp
//
//  Created by Кристина Перегудова on 25.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import RealmSwift

class NoteModelObj: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var text = ""
    @objc dynamic var time = ""
}
