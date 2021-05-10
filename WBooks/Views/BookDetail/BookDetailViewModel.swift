//
//  BookDetailViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

struct BookDetailViewModel {
    
    private let book: Book
    private let repository: CommentRepositoryType
    
    init(book: Book, repository: CommentRepositoryType = CommentRepository()) {
        self.book = book
        self.repository = repository
    }
    
    // MARK: - Public interface
    
    func createBookViewModel() -> BookViewModel {
        return BookViewModel(book: book)
    }
    
    func createCommentViewModel() -> CommentViewModel {
        return CommentViewModel(book: book, repository: repository)
    }
}
