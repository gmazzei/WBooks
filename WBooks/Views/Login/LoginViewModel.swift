//
//  LoginViewModel.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import SwiftUI

final class LoginViewModel: ObservableObject, LoginRepositoryTypeDelegate {
    
    @Published var isLogged: Bool
    @Published var showProgressView: Bool
    private var repository: LoginRepositoryType
    
    init(repository: LoginRepositoryType = LoginRepository()) {
        self.repository = repository
        self.isLogged = false
        self.showProgressView = false
        self.repository.delegate = self
    }
    
    // MARK: - Public interface
    
    func login() {
        showProgressView = true
        repository.login()
    }

    func didLogin(user: User) {
        isLogged = true
        showProgressView = false
    }
}
