//
//  LoginViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import SwiftUI

final class LoginViewModel: ObservableObject, LoginRepositoryTypeDelegate {
    
    @Published var isLogged: Bool
    private var repository: LoginRepositoryType
    
    init(repository: LoginRepositoryType = LoginRepository()) {
        self.repository = repository
        self.isLogged = false
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func login() {
        repository.login()
    }

    func didLogin(user: User) {
        isLogged = true
    }
}
