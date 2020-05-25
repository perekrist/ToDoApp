//
//  CreateView.swift
//  ToDoApp
//
//  Created by Кристина Перегудова on 24.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct CreateView: View {
    
    @State private var title = ""
    @State private var text = ""
    
    @Binding var show: Bool
    
    @ObservedObject var notesViewModel: NotesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Name", text: self.$title)
                .font(.title)
            
            TextField("Text", text: self.$text)
            
            Spacer()
            
            Button(action: {
                self.notesViewModel.save(note: NoteModel(id: self.notesViewModel.id, title: self.title, text: self.text, time: ""))
                self.notesViewModel.id += 1
                self.notesViewModel.get()
                self.show = false
            }, label: {
                Text("Save")
            })
        }.padding()
    }
}
