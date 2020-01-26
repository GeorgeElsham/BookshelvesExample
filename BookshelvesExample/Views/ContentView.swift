//
//  ContentView.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject private var reference: Reference
    @State private var newItem: String?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(reference.shelves, id: \.id) { shelf in
                    NavigationLink(destination: BookEditView(shelfId: shelf.id)) {
                        HStack {
                            Text(shelf.title)
                            Spacer()
                            Text(self.reference.totalBooks(for: shelf))
                        }
                    }
                }
                
                if newItem != nil {
                    TextField("New Shelf", text: $newItem.bound, onCommit: {
                        if !self.newItem!.isEmpty {
                            self.reference.addShelf(title: self.newItem!)
                        }
                        self.newItem = nil
                    })
                }
            }
            .navigationBarTitle("Shelves")
            .navigationBarItems(trailing: Button(action: {
                self.newItem = ""
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
            }))
        }
    }
}
