//
//  AddNewRepositoryStub.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

final class AddNewRepositoryStub: AddNewRepositoryType {
    
    weak var delegate: AddNewRepositoryTypeDelegate?
    
    func save(unidentifiedBook: UnidentifiedBook) {
        // No-op
    }
}
