//
//  AddNewRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

protocol AddNewRepositoryType {
    var delegate: AddNewRepositoryTypeDelegate? { get set }
    func save(book: Book)
}

protocol AddNewRepositoryTypeDelegate: AnyObject {
    func didSaveBook()
}

final class AddNewRepository: AddNewRepositoryType {
    
    weak var delegate: AddNewRepositoryTypeDelegate?
    
    func save(book: Book) {
        API.shared.save(book: book) { [weak self] in
            self?.delegate?.didSaveBook()
        }
    }
}
