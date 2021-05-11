//
//  API.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import Foundation

final class API {
    
    static let shared = API()
    
    private var books: [Book]
    private var users: [User]
    private var comments: [Comment]
    private var rents: [Rent]
    
    private init() {
        self.books = [
            Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
            Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
            Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
            Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
            Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Bronte", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
        ]
        
        self.users = [
            Auth.shared.user,
            User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Jane Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Pepe Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg")
        ]
        
        self.comments = [
            Comment(user: users[0], book: books[2], content: "Nice book!"),
            Comment(user: users[1], book: books[1], content: "Nice book!"),
            Comment(user: users[2], book: books[0], content: "Nice book!"),
            Comment(user: users[0], book: books[2], content: "Nice book!"),
            Comment(user: users[1], book: books[1], content: "Nice book!"),
            Comment(user: users[2], book: books[0], content: "Nice book!"),
            Comment(user: users[0], book: books[2], content: "Nice book!"),
            Comment(user: users[1], book: books[1], content: "Nice book!"),
        ]
        
        self.rents = []
    }
    
    // MARK: - Public interface
    
    func fetchBooks(completion: ([Book]) -> Void) {
         completion(books)
    }
    
    func fetchComments(for book: Book, completion: ([Comment]) -> Void) {
        let list = comments.filter { $0.book == book }
        completion(list)
    }
    
    func save(book: Book, completion: () -> Void) {
        self.books.append(book)
        completion()
    }
    
    func rent(book: Book, user: User, completion: (Rent) -> Void) {
        let today = Date()
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today) else { return }
        let rent = Rent(book: book, user: user, from: today, to: tomorrow)
        self.rents.append(rent)
        completion(rent)
    }
    
    func fetchRent(book: Book, completion: (Rent?) -> Void) {
        let rent = rents.last(where: { $0.book == book })
        completion(rent)
    }
}
