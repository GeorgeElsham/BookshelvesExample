//
//  BookshelvesModel.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import SwiftUI


// MARK: - This allows the shelves, books, and pages to be refrenced or modified.
class BookshelvesModel: ObservableObject {
    
    @Published var shelves = [
        Shelf(
            id: 0,
            title: "Example shelf",
            books: [
                Book(
                    id: 0,
                    title: "Example book",
                    pages: [Page(id: 0, content: "Example page", bookId: 0)],
                    shelfId: 0
                )
            ]
        )
    ]
    var books: [Book] {
        shelves[shelfId].books
    }
    var pages: [Page] {
        shelves[shelfId].books[bookId].pages
    }
    
    var shelfId = 0
    var bookId = 0
    
    func addShelf(title: String) {
        let newShelfId = shelves.count
        let newShelf = Shelf(id: newShelfId, title: title, books: [])
        shelves.append(newShelf)
    }
    func addBook(title: String) {
        let newBookId = shelves[shelfId].books.count
        let newBook = Book(id: newBookId, title: title, pages: [], shelfId: shelfId)
        shelves[shelfId].books.append(newBook)
    }
    func addPage(content: String) {
        let newPageId = shelves[shelfId].books[bookId].pages.count
        let newPage = Page(id: newPageId, content: content, bookId: bookId)
        shelves[shelfId].books[bookId].pages.append(newPage)
    }
    
    func totalBooks(for shelf: Shelf) -> String {
        "\(shelf.books.count) book\(shelf.books.count == 1 ? "" : "s")"
    }
    func totalPages(for book: Book) -> String {
        "\(book.pages.count) page\(book.pages.count == 1 ? "" : "s")"
    }
}
