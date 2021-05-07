//
//  LibraryView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct LibraryView: View {

    private struct Constants {
        static let cellSpacing: CGFloat = 15
        static let scrollViewTopPadding: CGFloat = 32
        static let scrollViewBottomPadding: CGFloat = 5
        static let scrollViewHorizontalPadding: CGFloat = 20 
    }
    
    @ObservedObject private var viewModel: LibraryViewModel
    
    init(viewModel: LibraryViewModel = LibraryViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: Constants.cellSpacing) {
                ForEach(viewModel.cellModels) { cellModel in
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            LibraryCell(viewModel: cellModel)
                        })
                        .frame(height: LibraryCell.height)
                }
            }
            .padding(EdgeInsets(top: Constants.scrollViewTopPadding,
                                leading: Constants.scrollViewHorizontalPadding,
                                bottom: Constants.scrollViewBottomPadding,
                                trailing: Constants.scrollViewHorizontalPadding))
        }
        .background(WBooksColors.backgroundColor)
        .navigationBarTitle("LibrayView.navigationView.title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    print("Alert")
                }, label: {
                    WBooksImages.notifications
                        .renderingMode(.template)
                })
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("Search")
                }, label: {
                    WBooksImages.search
                        .renderingMode(.template)
                })
            }
        }
        .onAppear {
            viewModel.fetchBooks()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LibraryView()
        }
    }
}
