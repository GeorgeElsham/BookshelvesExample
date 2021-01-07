//
//  Optional-bound.swift
//  BookshelvesExample
//
//  Created by George Elsham on 26/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

import Foundation


// MARK: - Extension to allows Optional Bindings.
extension Optional where Wrapped == String {

    var bound: String {
        get { self ?? "" }
        set { self = newValue }
    }
}
