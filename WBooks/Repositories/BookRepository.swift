//
//  BookRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 07/05/2021.
//

protocol BookRepositoryType {
    var delegate: BookRepositoryTypeDelegate? { get set }
    func fetchBooks()
}

protocol BookRepositoryTypeDelegate: AnyObject {
    func didFetchBooks(books: [Book])
}

final class BookRepository: BookRepositoryType {
    
    private let books: [Book] = [
        Book(title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
        Book(title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
        Book(title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
        Book(title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
        Book(title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
    ]
    
    weak var delegate: BookRepositoryTypeDelegate?
    
    func fetchBooks() {
        delegate?.didFetchBooks(books: books)
    }
    
}
