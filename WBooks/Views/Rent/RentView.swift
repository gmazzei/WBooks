//
//  RentView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 11/05/2021.
//

import SwiftUI

struct RentView: View {
    
    @ObservedObject private var viewModel: RentViewModel
    
    init(viewModel: RentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GradientButton(viewModel.buttonText, isEnabled: viewModel.canRent) {
            viewModel.makeRent()
        }
        .onAppear(perform: viewModel.fetchRent)
    }
}

struct RentView_Previews: PreviewProvider {
    
    private static var viewModel: RentViewModel {
        let book = Book(id: UUID(), title: "TItle", author: "Author",
                        image: "", year: 2021, genre: .novel)
        return RentViewModel(book: book)
    }
    
    static var previews: some View {
        RentView(viewModel: viewModel)
    }
}
