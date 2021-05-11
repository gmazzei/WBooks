//
//  RentViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import SwiftUI

final class RentViewModel: ObservableObject, RentRepositoryTypeDelegate {
    
    private var repository: RentRepositoryType
    private let book: Book
    @Published private var rent: Rent?
    
    init(book: Book, repository: RentRepositoryType = RentRepository()) {
        self.repository = repository
        self.book = book
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func makeRent() {
        print("Make rent")
        repository.rent(book: book)
    }
    
    func fetchRent() {
        print("fetch rent")
        repository.fetchRent(book: book)
    }
    
    var canRent: Bool {
        guard let rent = rent else { return true }
        return rent.to < Date()
    }
    
    // MARK: - RentRepositoryTypeDelegate
    
    func didRentBook(rent: Rent) {
        print("didRent")
        self.rent = rent
    }
    
    func didFetchRent(rent: Rent?) {
        print("didFetch")
        self.rent = rent
    }
    
}
