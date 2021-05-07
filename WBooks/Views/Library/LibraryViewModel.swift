//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

final class LibraryViewModel: ObservableObject, BookRepositoryTypeDelegate {
    
    private var repository: BookRepositoryType
    @Published private(set) var cellModels: [LibraryCellViewModel]
    
    // MARK: - Initializers
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
        self.cellModels = []
        self.repository.delegate = self
        self.repository.fetchBooks()
    }
    
    // MARK: - BookRepositoryTypeDelegate
    
    func didFetchBooks(books: [Book]) {
        cellModels = books.map { LibraryCellViewModel(book: $0) }
    }
}
