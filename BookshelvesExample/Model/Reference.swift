//
//  Reference.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


// MARK: - This allows the shelves, books, and pages to be refrenced or modified.
class Reference: ObservableObject {
    
    var shelves = [Shelf(id: 1,
                         title: "Example shelf",
                         books: [Book(id: 1,
                                      title: "Example book",
                                      pages: [Page(id: 1, content: "Example page", bookId: 1)],
                                      shelfId: 1)])]
    var books: [Book] {
        return shelves[shelfId - 1].books
    }
    var pages: [Page] {
        return shelves[shelfId - 1].books[bookId - 1].pages
    }
    
    var shelfId = 1
    var bookId = 1
    
    func addShelf(title: String) {
        let newShelfId = shelves.count + 1
        let newShelf = Shelf(id: newShelfId, title: title, books: [])
        
        objectWillChange.send()
        shelves.append(newShelf)
    }
    func addBook(title: String) {
        let newBookId = shelves[shelfId - 1].books.count + 1
        let newBook = Book(id: newBookId, title: title, pages: [], shelfId: shelfId)
        
        objectWillChange.send()
        shelves[shelfId - 1].books.append(newBook)
    }
    func addPage(content: String) {
        let newPageId = shelves[shelfId - 1].books[bookId - 1].pages.count + 1
        let newPage = Page(id: newPageId, content: content, bookId: bookId)
        
        objectWillChange.send()
        shelves[shelfId - 1].books[bookId - 1].pages.append(newPage)
    }
    
    func totalBooks(for shelf: Shelf) -> String {
        return "\(shelf.books.count) book\(shelf.books.count == 1 ? "" : "s")"
    }
    func totalPages(for book: Book) -> String {
        return "\(book.pages.count) page\(book.pages.count == 1 ? "" : "s")"
    }
}
