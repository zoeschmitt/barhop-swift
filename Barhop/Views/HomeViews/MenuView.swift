//
//  MenuView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/5/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI
import Combine

//custom image modifier
struct MenuImage: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .foregroundColor(Color.white)
            .font(.system(size: 16, weight: .bold))
            .frame(width: 50, height: 50)
            .background(Blur())
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

//sets modifier directly to view instead of using .modifier(menuImage())
extension View {
    func customMenuButton() -> some View {
        return self.modifier(MenuImage())
    }
}

struct MenuView: View {
    @State var showSearch: Bool = false
    @Binding var showFull: Bool
    @ObservedObject var store = DataStore()
    
    var body: some View {
        HStack {
            Button(action: {
                print("search")
                
            }) {
                Image(systemName: "magnifyingglass")
                    .customMenuButton()
            }
            
            Spacer()
            
            Button(action: {
                self.store.currentUser.showLocation.toggle()
                print("location toggled to: \(self.store.currentUser.showLocation)")
            }) {
                Image(systemName: "eye.fill")
                    .customMenuButton()
            }
        }
        .disabled(showFull)
    }
}

