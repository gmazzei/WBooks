//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI

final class AddNewViewModel: ObservableObject, AddNewRepositoryTypeDelegate {
     
    private var repository: AddNewRepositoryType
    
    // MARK: - Fields
    
    @Published var image: UIImage
    @Published var title: String
    @Published var author: String
    @Published var year: String
    @Published var genre: Genre
    
    // MARK: - Validation
    
    @Published var titleIsValid: Bool
    @Published var authorIsValid: Bool
    @Published var yearIsValid: Bool
    
    var isSubmitEnabled: Bool {
        return titleIsValid && authorIsValid && yearIsValid
    }
    
    // MARK: - Presentation
    
    @Published var showImagePicker: Bool
    
    // MARK: - Initializer
    
    init(repository: AddNewRepositoryType = AddNewRepository()) {
        self.repository = repository
        self.image = UIImage()
        self.title = ""
        self.author = ""
        self.year = ""
        self.genre = .educational
        self.titleIsValid = true
        self.authorIsValid = true
        self.yearIsValid = true
        self.showImagePicker = false
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func submit() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            let unidentifiedBook = UnidentifiedBook(title: self.title, author: self.author, image: self.image.encode(),
                                                    year: Int(self.year)!, genre: self.genre)
            DispatchQueue.main.async {
                self.repository.save(unidentifiedBook: unidentifiedBook)
            }
        }
    }
    
    // MARK: - Private utilities
    
    private func clear() {
        title = ""
        author = ""
        image = UIImage()
        year = ""
        genre = .educational
        titleIsValid = true
        authorIsValid = true
        yearIsValid = true
    }
    
    // MARK: - AddNewRepositoryTypeDelegate
    
    func didSaveBook() {
        clear()
    }
}
