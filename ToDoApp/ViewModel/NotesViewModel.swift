//
//  NotesViewModel.swift
//  ToDoApp
//
//  Created by Кристина Перегудова on 24.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import Foundation
import RealmSwift

class NotesViewModel: ObservableObject {
    
    @Published var notes = [NoteModel]()
    
    @Published var id = 0
    
    let config = Realm.Configuration(schemaVersion: 1)
    
    func save(note: NoteModel) {
        do {
            let realm = try Realm(configuration: config)
            let newNote = NoteModelObj()
            newNote.title = note.title
            newNote.text = note.text
            
            try realm.write({
                realm.add(newNote)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func get() {
        self.notes.removeAll()
        do {
            let realm = try Realm(configuration: config)
            let result = realm.objects(NoteModelObj.self)
            for i in result {
                notes.append(NoteModel(id: i.id, title: i.title, text: i.text, time: i.time))
            }
            print(notes)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func edit(note: NoteModel) {
        do {
            let realm = try Realm(configuration: config)
            let result = realm.objects(NoteModelObj.self)
            
            for i in result {
                try realm.write({
                    if note.id == i.id {
                        i.title = note.title
                        i.text = note.text
                        realm.add(i)
                    }
                })
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(note: NoteModel) {
        do {
            let realm = try Realm(configuration: config)
            let result = realm.objects(NoteModelObj.self)
            
            for i in result {
                try realm.write({
                    if note.id == i.id {
                        realm.delete(i)
                    }
                })
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

