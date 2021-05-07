//
//  LibraryCellViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import Foundation

struct LibraryCellViewModel: Identifiable {
    
    private(set) var id: UUID = UUID()
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    // MARK: - Public interface
    
    var title: String {
        book.title
    }
    
    var author: String {
        book.author
    }
    
    var image: String {
        book.image
    }
}
