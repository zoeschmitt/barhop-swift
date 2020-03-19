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
    var showModal = false
    var showSettings = false
    
    var body: some View {
            
        HStack {
            VStack(alignment: .leading) {
                ForEach(menu) { item in
                    MenuItem(title: item.title, icon: item.icon)
                }
                
                Spacer()
                
                HStack {
                    Text("Version 0.93").foregroundColor(.gray)
                    Spacer()
                }
            }
            .frame(maxWidth: 360)
                .padding(30).padding(.top, 30)
                .background(Color.white)
                .cornerRadius(15)
                .padding(.top, .none)
                .padding(.trailing, 50)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                .shadow(color: Color.black.opacity(0.3), radius: 30, x: 0, y: 10)
            
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
                .foregroundColor(Color(red: 0.6627450980392157, green: 0.7333333333333333, blue: 0.8313725490196079))
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
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
