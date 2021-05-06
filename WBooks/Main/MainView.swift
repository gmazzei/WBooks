//
//  MainView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct MainView: View {
    
    init() {
        
    }
    
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    VStack {
                        Text("MainView.tabItem.library")
                        Image("library").renderingMode(.template)
                    }
                }
            AddNewView()
                .tabItem {
                    VStack {
                        Text("MainView.tabItem.addNew")
                        Image("add_new")
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
