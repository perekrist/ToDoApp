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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Name", text: self.$title)
                .font(.title)
            
            TextField("Text", text: self.$text)
            
            Spacer()
        }.padding()
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
