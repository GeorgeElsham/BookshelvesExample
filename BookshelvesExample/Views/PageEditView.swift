//
//  PageEditView.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct PageEditView: View {
    
    @EnvironmentObject private var model: BookshelvesModel
    @State private var newItem: String?
    @State private var loaded = false
    let bookId: Int
    
    var body: some View {
        List {
            if loaded {
                ForEach(model.pages, id: \.id) { page in
                    Text(page.content)
                }
                
                if let newItem = newItem {
                    TextField("New Page", text: $newItem.bound, onCommit: {
                        if !newItem.isEmpty {
                            model.addPage(content: newItem)
                        }
                        self.newItem = nil
                    })
                }
            }
        }
        .navigationBarTitle("Pages")
        .navigationBarItems(
            trailing: Button(
                action: { newItem = "" },
                label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            )
        )
        .onAppear {
            DispatchQueue.main.async {
                model.bookId = bookId
                loaded = true
            }
        }
    }
}
