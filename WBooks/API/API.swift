//
//  API.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import Foundation

final class API {
    
    static let shared = API()
    
    private let testUser = User(username: "Test", image: "https://images.booksense.com/images/499/282/9781788282499.jpg")
    
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
            User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Jane Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Pepe Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            testUser
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
        
        self.rents = [
            Rent(book: books[1], user: users[0], from: Date(), to: Calendar.current.tomorrow)
        ]
    }
    
    // MARK: - Public interface
    
    func fetchBooks(completion: ([Book]) -> Void) {
         completion(books)
    }
    
    func fetchComments(for book: Book, completion: ([Comment]) -> Void) {
        let list = comments.filter { $0.book == book }
        completion(list)
    }
    
    func save(unidentifiedBook: UnidentifiedBook, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {
                completion()
                return
            }
            
            let imageUrl = self.saveImage(encodedString: unidentifiedBook.image)
            
            DispatchQueue.main.async {
                let book = Book(id: UUID(), title: unidentifiedBook.title,
                                author: unidentifiedBook.author, image: imageUrl,
                                year: unidentifiedBook.year, genre: unidentifiedBook.genre)
                
                self.books.append(book)
                completion()
            }
        }
    }
    
    func rent(book: Book, user: User, completion: (Status) -> Void) {
        let today = Date()
        let rent = Rent(book: book, user: user, from: today, to: Calendar.current.tomorrow)
        self.rents.append(rent)
        completion(.inYourHands)
    }
    
    func fetchRent(book: Book, user: User, completion: (Status) -> Void) {
        guard let rent = rents.last(where: { $0.book == book }) else {
            completion(.available)
            return
        }
        
        if rent.to < Date() {
            completion(.available)
        } else if rent.user == user {
            completion(.inYourHands)
        } else {
            completion(.unavailable)
        }
    }
    
    func login(completion: (User) -> Void) {
        completion(testUser)
    }
    
    // MARK: - Private utilities
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func saveImage(encodedString: String) -> String {
        guard let data = Data(base64Encoded: encodedString, options: .ignoreUnknownCharacters) else { return "" }

        let url = getDocumentsDirectory().appendingPathComponent(UUID().uuidString)
        do {
            try data.write(to: url)
            return url.absoluteString
        } catch {
            return ""
        }
    }
}

private extension Calendar {
    
    var tomorrow: Date {
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date()) else { return Date() }
        return tomorrow
    }
    
}
