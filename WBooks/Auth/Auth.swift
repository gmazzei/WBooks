//
//  Auth.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

final class Auth {
    
    static let shared = Auth()
    
    var user: User!
    
    private init() { }
}
