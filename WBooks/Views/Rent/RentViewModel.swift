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
    @Published private(set) var status: Status
    
    init(book: Book, repository: RentRepositoryType = RentRepository()) {
        self.repository = repository
        self.book = book
        self.status = .unavailable
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func makeRent() {
        repository.rent(book: book)
    }
    
    func fetchRent() {
        repository.fetchRent(book: book)
    }
    
    var canRent: Bool {
        status == .available
    }
    
    var buttonText: LocalizedStringKey {
        switch status {
        case .available:
            return "BookDetailView.button.title.available"
        case .unavailable:
            return "BookDetailView.button.title.unavailable"
        case .inYourHands:
            return "BookDetailView.button.title.inYourHands"
        }
    }
    
    // MARK: - RentRepositoryTypeDelegate
    
    func didRentBook(status: Status) {
        self.status = status
    }
    
    func didFetchRent(status: Status) {
        self.status = status
    }
    
}
