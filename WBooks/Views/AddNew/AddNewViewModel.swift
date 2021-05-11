//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI

final class AddNewViewModel: ObservableObject {
     
    private let repository: AddNewRepositoryType
    
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var image: UIImage = UIImage()
    @Published var year: String = Calendar.current.component(.year, from: Date()).description
    @Published var genre: Genre = .educational
    
    init(repository: AddNewRepositoryType = AddNewRepository()) {
        self.repository = repository
    }
    
    func submit() {
        let unidentifiedBook = UnidentifiedBook(title: title, author: author, image: image.encode(), year: Int(year)!, genre: genre)
        repository.save(unidentifiedBook: unidentifiedBook)
    }
}
