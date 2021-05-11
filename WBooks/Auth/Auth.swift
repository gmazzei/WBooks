//
//  Auth.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

final class Auth {
    
    static let shared = Auth()
    
    let user: User = User(username: "test", image: "")
    
    private init() { }
}
