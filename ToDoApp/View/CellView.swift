//
//  CellView.swift
//  ToDoApp
//
//  Created by Кристина Перегудова on 24.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct CellView: View {
    
    @State var edit: Bool
    @State var note: NoteModel
    
    var body: some View {
        
        HStack {
            if edit {
                Button(action: {
                    
                }) {
                    Image(systemName: "minus.circle").font(.title)
                }.foregroundColor(.red)
            }
            
            Text(note.title).lineLimit(1)
            
            Spacer()
            
            Text(note.time)
            
        }.padding()
            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
            .animation(.spring())
        
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(edit: false, note: NoteModel(id: UUID(), title: "Hello", text: "Hello, World!", time: "24.05.2020"))
    }
}
