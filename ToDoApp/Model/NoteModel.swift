//
//  NoteModel.swift
//  ToDoApp
//
//  Created by Кристина Перегудова on 24.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation

struct NoteModel: Identifiable {
    var id: UUID
    var title: String
    var text: String
    var time: String
}
