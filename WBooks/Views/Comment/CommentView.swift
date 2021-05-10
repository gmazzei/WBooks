//
//  CommentView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 09/05/2021.
//

import SwiftUI

struct CommentView: View {
    
    private struct Constants {
        static let cellSpacing: CGFloat = 4
    }
    
    @ObservedObject private var viewModel: CommentViewModel
    
    init(viewModel: CommentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: Constants.cellSpacing) {
                ForEach(viewModel.cellModels) { cellModel in
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            CommentCell(viewModel: cellModel)
                        })
                }
            }
        }
        .onAppear(perform: onLoad)
    }
    
    private func onLoad() {
        viewModel.fetchComment()
    }
}

struct CommentView_Previews: PreviewProvider {
    
    private static var viewModel: CommentViewModel {
        let book = Book(title: "Jane Eyre", author: "Charlotte Bronte",
                        image: "", year: 1847, genre: .novel)
        let repository = CommentRepositoryStub()
        
        return CommentViewModel(book: book, repository: repository)
    }
    
    static var previews: some View {
        CommentView(viewModel: viewModel)
    }
}
