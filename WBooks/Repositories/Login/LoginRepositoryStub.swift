//
//  LoginRepositoryStub.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

final class LoginRepositoryStub: LoginRepositoryType {
    
    var delegate: LoginRepositoryTypeDelegate?
    
    func login() {
        // No-op
    }
}
