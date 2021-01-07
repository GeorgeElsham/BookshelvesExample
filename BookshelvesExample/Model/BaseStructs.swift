//
//  BaseStructs.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import Foundation


// MARK: - Your structures you said you cannot modify.
struct Shelf {
    var id: Int
    var title: String
    var books: [Book]
}

struct Book {
    var id: Int
    var title: String
    var pages: [Page]
    var shelfId: Int
}

struct Page {
    var id: Int
    var content: String
    var bookId: Int
}
