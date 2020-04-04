//
//  MenuView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/5/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

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
    @Binding var showMenu: Bool
    @State var showSearch: Bool = false
    @Binding var showFull: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.showMenu.toggle()
                
            }) {
                Image(systemName: "hare.fill")
                    .customMenuButton()
            }
            
            //expand out search bar??
            if showSearch {
                
                
            } else {
                Spacer()
            }
            
            Button(action: {
                print("hi")
                
            }) {
                Image(systemName: "magnifyingglass")
                    .customMenuButton()
            }
            
            Button(action: {
                print("hi")
                
            }) {
                Image(systemName: "eye.fill")
                    .customMenuButton()
            }
        }
        .disabled(showFull)
    }
}
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
