//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI

final class AddNewViewModel: ObservableObject, AddNewRepositoryTypeDelegate {
     
    private var repository: AddNewRepositoryType
    
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var image: UIImage = UIImage()
    @Published var year: String = ""
    @Published var genre: Genre = .educational
    
    init(repository: AddNewRepositoryType = AddNewRepository()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
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
    
    // MARK: - AddNewRepositoryTypeDelegate
    
    func didSaveBook() {
        clear()
    }
    
    // MARK: - Private utilities
    
    private func clear() {
        title = ""
        author = ""
        image = UIImage()
        year = ""
        genre = .educational
    }
}
