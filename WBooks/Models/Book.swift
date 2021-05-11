//
//  Book.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import Foundation

struct Book: Equatable {
    var id: UUID
    var title: String
    var author: String
    var image: String
    var year: Int
    var genre: Genre
}

