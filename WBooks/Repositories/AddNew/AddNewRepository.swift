//
//  AddNewRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

protocol AddNewRepositoryType {
    var delegate: AddNewRepositoryTypeDelegate? { get set }
    func save(unidentifiedBook: UnidentifiedBook)
}

protocol AddNewRepositoryTypeDelegate: AnyObject {
    func didSaveBook()
}

final class AddNewRepository: AddNewRepositoryType {
    
    weak var delegate: AddNewRepositoryTypeDelegate?
    
    func save(unidentifiedBook: UnidentifiedBook) {
        API.shared.save(unidentifiedBook: unidentifiedBook) { [weak self] in
            self?.delegate?.didSaveBook()
        }
    }
}
