//
//  ContentView.swift
//  ToDoApp
//
//  Created by Кристина Перегудова on 24.05.2020.
//  Copyright © 2020 Кристина Перегудова. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var edit = false
    @State private var show = false
    @State private var notes: [NoteModel] = []
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
            
            VStack {
                VStack(spacing: 5) {
                    HStack {
                        Text("ToDo")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Button(action: {
                            self.edit.toggle()
                        }) {
                            Text(self.edit ? "Done" : "Edit")
                        }
                        
                    }.padding([.leading,.trailing], 15)
                        .padding(.top, 10)
                    
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "plus").resizable().frame(width: 25, height: 25).padding()
                    }.foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Circle())
                        .padding(.bottom, -15)
                        .offset(y: 15)
                    
                }.background(Rounded().fill(Color.white))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        ForEach(notes){ note in
                            VStack(alignment: .leading) {
                                CellView(edit: self.edit, note: note)
                            }.padding()
                                .onTapGesture {
                                    self.show.toggle()
                            }
                        }
                    }.padding()
                    
                }.padding(.top, 30)
            }
            .sheet(isPresented: $show) {
                CreateView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
