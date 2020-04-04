//
//  SideMenuView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/16/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI


struct SideMenuView : View {
    
    var menuItems = ["My Account", "Billing", "Team", "Sign out"]
    var menu: [Menu] = menuData
    @Binding var showMenu: Bool
    var showSettings = false
    
    var body: some View {
            
        HStack {
            VStack(alignment: .leading) {
                ForEach(menu) { item in
                    MenuItem(title: item.title, icon: item.icon)
                }
                
                Spacer()
            }
            .padding(30).padding(.top, 30)
            .background(Blur())
//            .background(Color(#colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)))
            .cornerRadius(20)
            .padding(.trailing, 120)
            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 30, x: 0, y: 10)
            
            Spacer()
        }
    }
    
}

struct MenuItem : View {
    var title = ""
    var icon = "creditcard"
    
    var body: some View {
        return HStack {
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading, 10)
            Spacer()
            }
            .padding(10)
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Sign out", icon: "arrow.uturn.down"),
    Menu(title: "Settings", icon: "gear")
]
