//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

final class LibraryViewModel: ObservableObject, LibraryRepositoryTypeDelegate {
    
    private var repository: LibraryRepositoryType
    @Published private var books: [Book]
    
    
    // MARK: - Initializers
    
    init(repository: LibraryRepositoryType = LibraryRepository()) {
        self.books = []
        self.repository = repository
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func fetchBooks() {
        self.repository.fetchBooks()
    }
    
    var cellModels: [LibraryCellViewModel] {
        return books.map { LibraryCellViewModel(book: $0) }
    }
    
    // MARK: - BookRepositoryTypeDelegate
    
    func didFetchBooks(books: [Book]) {
        self.books = books
    }
}
