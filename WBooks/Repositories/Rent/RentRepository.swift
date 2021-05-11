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
    func didRentBook(status: Status)
    func didFetchRent(status: Status)
}

final class RentRepository: RentRepositoryType {
    
    weak var delegate: RentRepositoryTypeDelegate?

    func rent(book: Book) {
        API.shared.rent(book: book, user: Auth.shared.user) { [weak self] status in
            self?.delegate?.didRentBook(status: status)
        }
    }
    
    func fetchRent(book: Book) {
        API.shared.fetchRent(book: book, user: Auth.shared.user) { [weak self] status in
            self?.delegate?.didFetchRent(status: status)
        }
    }
}
