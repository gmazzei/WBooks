//
//  LibraryView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct LibraryView: View {

    private struct Constants {
        static let cellHorizontalPadding: CGFloat = 15
        static let cellVerticalPadding: CGFloat = 8
        static let scrollViewTopPadding: CGFloat = 32
        static let scrollViewBottomPadding: CGFloat = 5
        static let scrollViewHorizontalPadding: CGFloat = 0
        static let backgroundColor: Color = Color(red: 234/255, green: 246/255, blue: 250/255)
    }
    
    @ObservedObject private var viewModel: LibraryViewModel
    
    init(viewModel: LibraryViewModel = LibraryViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.cellModels) { cellModel in
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            LibraryCell(viewModel: cellModel)
                        })
                        .padding(EdgeInsets(top: Constants.cellVerticalPadding,
                                            leading: Constants.cellHorizontalPadding,
                                            bottom: Constants.cellVerticalPadding,
                                            trailing: Constants.cellHorizontalPadding))
                }
            }
            .padding(EdgeInsets(top: Constants.scrollViewTopPadding,
                                leading: Constants.scrollViewHorizontalPadding,
                                bottom: Constants.scrollViewBottomPadding,
                                trailing: Constants.scrollViewHorizontalPadding))
        }
        .background(Constants.backgroundColor)
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
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LibraryView()
        }
    }
}
