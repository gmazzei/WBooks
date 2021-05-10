//
//  Book.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

struct Book {
    
    let title: String
    let author: String
    let image: String
    let year: Int
    let genre: Genre
    
    enum Genre: String {
        case novel
        case history
        case educational
        
        var description: String {
            return rawValue.capitalized
        }
    }
}

