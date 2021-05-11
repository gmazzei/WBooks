//
//  BookViewModel.swift
//  WBooksTests
//
//  Created by Gabriel Mazzei on 10/05/2021.
//


import Foundation

final class BookViewModel {
    
    private var book: Book
    
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
    
    var year: Int {
        book.year
    }
    
    var genre: String {
        book.genre.description
    }
}
