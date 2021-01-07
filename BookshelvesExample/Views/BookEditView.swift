//
//  BookEditView.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct BookEditView: View {
    
    @EnvironmentObject private var model: BookshelvesModel
    @State private var newItem: String?
    @State private var loaded = false
    let shelfId: Int
    
    var body: some View {
        List {
            if loaded {
                ForEach(model.books, id: \.id) { book in
                    NavigationLink(destination: PageEditView(bookId: book.id)) {
                        HStack {
                            Text(book.title)
                            Spacer()
                            Text(model.totalPages(for: book))
                        }
                    }
                }
                
                if let newItem = newItem {
                    TextField("New Book", text: $newItem.bound, onCommit: {
                        if !newItem.isEmpty {
                            model.addBook(title: newItem)
                        }
                        self.newItem = nil
                    })
                }
            }
        }
        .navigationBarTitle("Books")
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
                model.shelfId = shelfId
                loaded = true
            }
        }
    }
}
