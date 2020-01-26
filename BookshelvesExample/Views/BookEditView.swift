//
//  BookEditView.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct BookEditView: View {
    
    @EnvironmentObject private var reference: Reference
    @State private var newItem: String?
    @State private var loaded = false
    let shelfId: Int
    
    var body: some View {
        List {
            if loaded {
                ForEach(reference.books, id: \.id) { book in
                    NavigationLink(destination: PageEditView(bookId: book.id)) {
                        HStack {
                            Text(book.title)
                            Spacer()
                            Text(self.reference.totalPages(for: book))
                        }
                    }
                }
                
                if newItem != nil {
                    TextField("New Book", text: $newItem.bound, onCommit: {
                        if !self.newItem!.isEmpty {
                            self.reference.addBook(title: self.newItem!)
                        }
                        self.newItem = nil
                    })
                }
            }
        }
        .navigationBarTitle("Books")
        .navigationBarItems(trailing: Button(action: {
            self.newItem = ""
        }, label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
        }))
        .onAppear {
            DispatchQueue.main.async {
                self.reference.shelfId = self.shelfId
                self.loaded = true
            }
        }
    }
}
