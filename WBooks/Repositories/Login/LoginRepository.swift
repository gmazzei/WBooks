//
//  LoginRepository.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

protocol LoginRepositoryType {
    var delegate: LoginRepositoryTypeDelegate? { get set }
    func login()
}

protocol LoginRepositoryTypeDelegate: AnyObject {
    func didLogin(user: User)
}

final class LoginRepository: LoginRepositoryType {
    
    weak var delegate: LoginRepositoryTypeDelegate?

    func login() {
        API.shared.login(completion: { [weak self] user in
            Auth.shared.user = user
            self?.delegate?.didLogin(user: user)
        })
    }
}
