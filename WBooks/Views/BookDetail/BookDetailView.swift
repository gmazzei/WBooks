//
//  BookDetailView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 10/05/2021.
//

import SwiftUI

struct BookDetailView: View {
    
    private struct Constants {
        static let sectionSpacing: CGFloat = 12
        static let scrollViewTopPadding: CGFloat = 32
        static let scrollViewBottomPadding: CGFloat = 5
        static let scrollViewHorizontalPadding: CGFloat = 20
    }
    
    private let viewModel: BookDetailViewModel
    
    init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: Constants.sectionSpacing) {
                BookView(viewModel: viewModel.createBookViewModel(),
                         buttonView: AnyView(RentView(viewModel: viewModel.createRentViewModel())))
                CommentView(viewModel: viewModel.createCommentViewModel())
            }
            .padding(EdgeInsets(top: Constants.scrollViewTopPadding,
                            leading: Constants.scrollViewHorizontalPadding,
                            bottom: Constants.scrollViewBottomPadding,
                            trailing: Constants.scrollViewHorizontalPadding))
        }
        .background(WBooksColors.backgroundColor)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("BookDetailView.navigationView.title")
    }
}

struct BookDetailView_Previews: PreviewProvider {
    
    private static var viewModel: BookDetailViewModel {
        let book = Book(id: UUID(), title: "Title", author: "Author",
                        image: "", year: 2021, genre: .novel)
        return BookDetailViewModel(book: book)
    }
    
    static var previews: some View {
        NavigationView {
            BookDetailView(viewModel: viewModel)
        }
    }
}
