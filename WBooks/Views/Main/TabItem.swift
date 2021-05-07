//
//  TabItem.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct TabItem: Identifiable {
    
    var id: UUID = UUID()
    let view: AnyView
    let imageName: String
    let localizedKey: LocalizedStringKey
}
