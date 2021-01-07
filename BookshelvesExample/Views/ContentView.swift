//
//  ContentView.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject private var model: BookshelvesModel
    @State private var newItem: String?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.shelves, id: \.id) { shelf in
                    NavigationLink(destination: BookEditView(shelfId: shelf.id)) {
                        HStack {
                            Text(shelf.title)
                            Spacer()
                            Text(model.totalBooks(for: shelf))
                        }
                    }
                }
                
                if let newItem = newItem {
                    TextField("New Shelf", text: $newItem.bound, onCommit: {
                        if !newItem.isEmpty {
                            model.addShelf(title: newItem)
                        }
                        self.newItem = nil
                    })
                }
            }
            .navigationBarTitle("Shelves")
            .navigationBarItems(
                trailing: Button(
                    action: { newItem = "" },
                    label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                )
            )
        }
    }
}
