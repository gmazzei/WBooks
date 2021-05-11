//
//  BookDetailViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

final class BookDetailViewModel {
    
    private let book: Book
    private var rentRepository: RentRepositoryType
    private let commentRepository: CommentRepositoryType
    
    init(book: Book,
         rentRepository: RentRepositoryType = RentRepository(),
         commentRepository: CommentRepositoryType = CommentRepository()) {
        self.book = book
        self.rentRepository = rentRepository
        self.commentRepository = commentRepository
    }
    
    // MARK: - Public interface
    
    func createBookViewModel() -> BookViewModel {
        return BookViewModel(book: book)
    }
    
    func createRentViewModel() -> RentViewModel {
        return RentViewModel(book: book, repository: rentRepository)
    }
    
    func createCommentViewModel() -> CommentViewModel {
        return CommentViewModel(book: book, repository: commentRepository)
    }
    
}
