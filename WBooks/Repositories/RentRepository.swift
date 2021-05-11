//
//  RentRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

protocol RentRepositoryType {
    var delegate: RentRepositoryTypeDelegate? { get set }
    func rent(book: Book)
    func fetchRent(book: Book)
}

protocol RentRepositoryTypeDelegate: AnyObject {
    func didRentBook(rent: Rent)
    func didFetchRent(rent: Rent?)
}

final class RentRepository: RentRepositoryType {
    
    weak var delegate: RentRepositoryTypeDelegate?

    func rent(book: Book) {
        API.shared.rent(book: book, user: Auth.shared.user) { [weak self] rent in
            self?.delegate?.didRentBook(rent: rent)
        }
    }
    
    func fetchRent(book: Book) {
        API.shared.fetchRent(book: book) { [weak self] rent in
            self?.delegate?.didFetchRent(rent: rent)
        }
    }
}
