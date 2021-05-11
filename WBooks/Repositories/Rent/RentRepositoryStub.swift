//
//  RentRepositoryStub.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import Foundation

final class RentRepositoryStub: RentRepositoryType {
    
    weak var delegate: RentRepositoryTypeDelegate?
    
    func rent(book: Book) {
        // No-op
    }
    
    func fetchRent(book: Book) {
        // No-op
    }
}
