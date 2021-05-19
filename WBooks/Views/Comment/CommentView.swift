//
//  CommentView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

import SwiftUI

struct CommentView: View {
    
    private struct Constants {
        static let cellSpacing: CGFloat = 0
        static let containerCornerRadius: CGFloat = 10
        static let containerShadow: CGFloat = 0.3
    }
    
    @ObservedObject private var viewModel: CommentViewModel
    
    init(viewModel: CommentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LazyVStack(spacing: Constants.cellSpacing) {
            ForEach(viewModel.cellModels) { cellModel in
                CommentCell(viewModel: cellModel)
            }
        }
        .modifier(ProgressViewModifier(show: viewModel.showProgressView))
        .cornerRadius(Constants.containerCornerRadius)
        .shadow(radius: Constants.containerShadow)
        .onAppear(perform: onLoad)
    }
    
    private func onLoad() {
        viewModel.fetchComments()
    }
}

struct CommentView_Previews: PreviewProvider {
    
    private static var viewModel: CommentViewModel {
        let book = Book(id: UUID(), title: "Title", author: "Author",
                        image: "", year: 2021, genre: .novel)
        return CommentViewModel(book: book)
    }
    
    static var previews: some View {
        CommentView(viewModel: viewModel)
    }
}
