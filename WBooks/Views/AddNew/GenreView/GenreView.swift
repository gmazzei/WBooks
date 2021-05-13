//
//  GenreView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 13/05/2021.
//

import SwiftUI

struct GenreView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel: AddNewViewModel
    
    init(viewModel: AddNewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(Genre.allCases, id: \.self) { genre in
                    HStack {
                        Text(genre.description)
                        Spacer()
                        Image(systemName: "checkmark")
                            
                            .foregroundColor(WBooksColors.primaryBlue)
                            .opacity(viewModel.genre == genre ? 1.0 : 0.0)
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 16)
                    .padding([.top, .bottom], 12)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.genre = genre
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    Divider()
                }
            }
        }
        .padding([.top, .bottom], 16)
        .navigationBarTitle("GenreView.title")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct GenreView_Previews: PreviewProvider {
    
    private static var viewModel: AddNewViewModel {
        return AddNewViewModel()
    }
    
    static var previews: some View {
        NavigationView {
            GenreView(viewModel: viewModel)
        }
    }
}
