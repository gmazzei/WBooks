//
//  LibraryCell.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct LibraryCell: View {
    
    private struct Constants {
        static let imageCornerRadius: CGFloat = 5
        static let imageWidth: CGFloat = 64
        static let imageHeight: CGFloat = 88
        
        static let columnSpacing: CGFloat = 12
        static let textSpacing: CGFloat = 5
        static let titleColor: Color = Color(white: 0.3)
        static let authorColor: Color = Color(white: 0.4)
        
        static let containerCornerRadius: CGFloat = 10
        static let containerShadow: CGFloat = 0.3
        static let containerPadding: EdgeInsets = EdgeInsets(top: 16, leading: 16,
                                                             bottom: 16, trailing: 16)
    }
    
    static var height: CGFloat {
        return Constants.imageHeight + Constants.containerPadding.top + Constants.containerPadding.bottom
    }
    
    static var spacing: CGFloat = 16
    
    private let viewModel: LibraryCellViewModel
    
    init(viewModel: LibraryCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: Constants.columnSpacing) {
            ZStack {
                RemoteImage(url: viewModel.image)
                    .cornerRadius(Constants.imageCornerRadius)
                    .frame(width: Constants.imageWidth, height: Constants.imageHeight)
            }
            .aspectRatio(contentMode: .fill)
            .background(Color(white: 0.97))
            .cornerRadius(Constants.imageCornerRadius)
            
            VStack(alignment: .leading, spacing: Constants.textSpacing) {
                Text(viewModel.title)
                    .foregroundColor(Constants.titleColor)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                
                Text(viewModel.author)
                    .foregroundColor(Constants.authorColor)
                    .fontWeight(.light)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(Constants.containerPadding)
        .background(Color.white)
        .cornerRadius(Constants.containerCornerRadius)
        .shadow(radius: Constants.containerShadow)
        .frame(height: LibraryCell.height)
    }
}

struct LibraryCell_Previews: PreviewProvider {
    private static var viewModel: LibraryCellViewModel {
        let book = Book(id: UUID(), title: "Jane Eyre", author: "Charlotte Bronte",
                        image: "", year: 1847, genre: .novel)
        return LibraryCellViewModel(book: book)
    }
    
    static var previews: some View {
        LibraryCell(viewModel: viewModel)
    }
}
