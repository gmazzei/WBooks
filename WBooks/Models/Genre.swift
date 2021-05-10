//
//  Genre.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

enum Genre: String, Equatable, CaseIterable {
    case novel
    case history
    case educational
    
    var description: String {
        return rawValue.capitalized
    }
}
