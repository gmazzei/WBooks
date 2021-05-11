//
//  RentRepositoryStub.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import Foundation

final class RentRepositoryStub: RentRepositoryType {
    
    weak var delegate: RentRepositoryTypeDelegate?
    private let status: Status
    
    init(status: Status = .available) {
        self.status = status
    }
    
    func rent(book: Book) {
        // No-op
    }
    
    func fetchRent(book: Book) {
        delegate?.didFetchRent(status: status)
    }
}
