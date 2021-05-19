//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI
import Combine

final class AddNewViewModel: ObservableObject, AddNewRepositoryTypeDelegate {
    
    private struct Constants {
        static let emptyImage: UIImage = UIImage()
    }
    
    private var repository: AddNewRepositoryType
    private var cancellableSet: Set<AnyCancellable>
    
    // MARK: - Presentation
    
    @Published var image: UIImage
    @Published var title: String
    @Published var author: String
    @Published var year: String
    @Published var genre: Genre
    
    @Published var submitEnabled: Bool
    @Published var imageMessage: LocalizedStringKey
    @Published var titleMessage: LocalizedStringKey
    @Published var authorMessage: LocalizedStringKey
    @Published var yearMessage: LocalizedStringKey
    
    @Published var showProgressView: Bool
    
    // MARK: - Initializer
    
    init(repository: AddNewRepositoryType = AddNewRepository()) {
        self.repository = repository
        self.cancellableSet = []
        self.image = Constants.emptyImage
        self.title = ""
        self.author = ""
        self.year = ""
        self.genre = .educational
        self.submitEnabled = false
        self.imageMessage = ""
        self.titleMessage = ""
        self.authorMessage = ""
        self.yearMessage = ""
        self.showProgressView = false
        self.repository.delegate = self
        setupPublishers()
    }
    
    private func setupPublishers() {
        let isImageValidPublisher = $image
            .dropFirst()
            .map { $0 != Constants.emptyImage }
            .eraseToAnyPublisher()
        
        let isTitleValidPublisher = $title
            .dropFirst()
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        let isAuthorValidPublisher = $author
            .dropFirst()
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
        
        let isYearValidPublisher = $year
            .dropFirst()
            .map { Int($0) != nil }
            .eraseToAnyPublisher()
        
        isImageValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                valid ? "" : "AddNewViewModel.image.error.message"
            }
            .assign(to: \.imageMessage, on: self)
            .store(in: &cancellableSet)
        
        isTitleValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                valid ? "" : "AddNewViewModel.title.error.message"
            }
            .assign(to: \.titleMessage, on: self)
            .store(in: &cancellableSet)
        
        isAuthorValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                valid ? "" : "AddNewViewModel.author.error.message"
            }
            .assign(to: \.authorMessage, on: self)
            .store(in: &cancellableSet)
        
        isYearValidPublisher
            .receive(on: RunLoop.main)
            .map { valid in
                valid ? "" : "AddNewViewModel.year.error.message"
            }
            .assign(to: \.yearMessage, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest4(isImageValidPublisher, isTitleValidPublisher, isAuthorValidPublisher, isYearValidPublisher)
            .map { $0 && $1 && $2 && $3 }
            .receive(on: RunLoop.main)
            .assign(to: \.submitEnabled, on: self)
            .store(in: &cancellableSet)
    }
    
    // MARK: - Public interface
    
    func submit() {
        showProgressView = true
        
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
    
    private func clearFields() {
        image = UIImage()
        title = ""
        author = ""
        year = ""
        genre = .educational
        submitEnabled = false
    }
    
    private func cancelPublishers() {
        cancellableSet.forEach { $0.cancel() }
        cancellableSet.removeAll()
    }
    
    // MARK: - AddNewRepositoryTypeDelegate
    
    func didSaveBook() {
        clearFields()
        cancelPublishers()
        setupPublishers()
        showProgressView = false
    }
}
