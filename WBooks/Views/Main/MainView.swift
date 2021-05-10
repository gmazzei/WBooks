//
//  MainView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

private struct Constants {
    static let defaultItems: [TabItem] = [
        TabItem(view: AnyView(NavigationView { LibraryView(viewModel: LibraryViewModel()) }), imageName: "library", localizedKey: "MainView.tabItem.library"),
        TabItem(view: AnyView(NavigationView { AddNewView(viewModel: AddNewViewModel()) }), imageName: "add_new", localizedKey: "MainView.tabItem.addNew")
    ]
}

struct MainView: View {
    
    private let items: [TabItem]
    
    init(items: [TabItem] = Constants.defaultItems) {
        self.items = items
    }
    
    var body: some View {
        TabView {
            ForEach(items, id: \.id) { item in
                item.view
                    .tabItem {
                        VStack {
                            Text(item.localizedKey)
                            Image(item.imageName)
                                .renderingMode(.template)
                        }
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
