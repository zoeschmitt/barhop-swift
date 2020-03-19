//
//  MenuView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/5/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @State var showSearch: Bool = false
    var body: some View {
        HStack {
            
            Button(action: {self.showMenu.toggle()}) {
                Image(systemName: "hare.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold))
                    .frame(width: 50, height: 50)
                    .background(Color.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            
            //Spacer()
            
            if showSearch {
                
                
            } else {
                Spacer()
            }
            
            Button(action: {print("hi")}) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.white)
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 50, height: 50)
                    .background(Color.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            
            Button(action: {print("hi")}) {
                Image(systemName: "eye.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold))
                    .frame(width: 50, height: 50)
                    .background(Color.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
        }
    }
}
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
