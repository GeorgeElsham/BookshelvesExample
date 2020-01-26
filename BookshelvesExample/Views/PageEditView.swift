//
//  PageEditView.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct PageEditView: View {
    
    @EnvironmentObject private var reference: Reference
    @State private var newItem: String?
    @State private var loaded = false
    let bookId: Int
    
    var body: some View {
        List {
            if loaded {
                ForEach(reference.pages, id: \.id) { page in
                    Text(page.content)
                }
                
                if newItem != nil {
                    TextField("New Page", text: $newItem.bound, onCommit: {
                        if !self.newItem!.isEmpty {
                            self.reference.addPage(content: self.newItem!)
                        }
                        self.newItem = nil
                    })
                }
            }
        }
        .navigationBarTitle("Pages")
        .navigationBarItems(trailing: Button(action: {
            self.newItem = ""
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
        }))
        .onAppear {
            DispatchQueue.main.async {
                self.reference.bookId = self.bookId
                self.loaded = true
            }
        }
    }
}
