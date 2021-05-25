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
            Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Brontë", image: "https://images.booksense.com/images/499/282/9781788282499.jpg", year: 1847, genre: .novel),
            Book(id: UUID(), title: "The Hobbit", author: "J.R.R Tolkien", image: "https://i.harperapps.com/hcanz/covers/9780261102217/x293.jpg", year: 1937, genre: .novel),
            Book(id: UUID(), title: "Wuthering Heights", author: "Emily Brontë", image: "https://images-na.ssl-images-amazon.com/images/I/71ogwlE3YNL.jpg", year: 1847, genre: .novel),
            Book(id: UUID(), title: "The Martian Chronicles", author: "Ray Bradbury", image: "https://cdn.waterstones.com/bookjackets/large/9780/0064/9780006479239.jpg", year: 1950, genre: .novel),
            Book(id: UUID(), title: "El Coronel No Tiene Quien Le Escriba", author: "Gabriel García Márquez", image: "https://images-na.ssl-images-amazon.com/images/I/71MB0yX7mlL.jpg", year: 1847, genre: .novel),
        ]
        
        self.users = [
            User(username: "John Smith", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Pepe Andersen", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Rudolph McKenzie", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Mario Santos", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Jamie Jefferson", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Jane Williams", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            User(username: "Olivia Johansen", image: "https://images.booksense.com/images/499/282/9781788282499.jpg"),
            testUser
        ]
        
        self.comments = [
            Comment(user: users[0], book: books[2], content: "Nice book!"),
            Comment(user: users[1], book: books[1], content: "Awesome!"),
            Comment(user: users[2], book: books[0], content: "Cool!"),
            Comment(user: users[0], book: books[2], content: "I recommend it!"),
            Comment(user: users[1], book: books[1], content: "Nicee"),
            Comment(user: users[2], book: books[0], content: "One of the best I have ever read"),
            Comment(user: users[0], book: books[2], content: "Awesome indeed"),
            Comment(user: users[1], book: books[1], content: "Nice book! I definitely recommend it"),
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
