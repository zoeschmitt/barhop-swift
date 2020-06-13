//
//  ContentView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 1/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI
import Mapbox

let screen = UIScreen.main.bounds

let addy: Address = Address(street: "124 N Lyndon B Johnson Dr", city: "San Marcos", state: "TX", zip: "78666")

struct ContentView: View {
    @State var loggedIn: Bool = false
    @State var selectedScreen = 0
    @State var showFull = false
    @State var showCard = false
    var body: some View {
        ZStack {
            
            Color.white
            
            
            if !loggedIn {
                FirstView(loggedIn: $loggedIn)
            } else {
            
            if selectedScreen == 1 {
                MessagesView()
            }
            else if selectedScreen == 2 {
                ProfileView()
            } else {
                HomeView(showCard: $showCard, showFull: $showFull)
            }
            
            
            VStack {
                
                Spacer()
                
                HStack() {
                    
                    Button(action: {
                        self.selectedScreen = 0
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(self.selectedScreen == 0 ? Color.black : Color.black.opacity(0.2))
                    }
                    Spacer()
                    Button(action: {
                        self.selectedScreen = 1
                    }) {
                        Image(systemName: "bubble.left.fill")
                        .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(self.selectedScreen == 1 ? Color.black : Color.black.opacity(0.2))
                    }
                    Spacer()
                    Button(action: {
                        self.selectedScreen = 2
                    }) {
                        Image(systemName: "person.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(self.selectedScreen == 2 ? Color.black : Color.black.opacity(0.2))
                    }
                    
                }
                .padding(.top, 25)
                .padding(.bottom, 45)
                .padding(.horizontal, 35)
                .frame(width: screen.size.width)
                .background(Color.white)
                .cornerRadius(14, corners: [.topLeft, .topRight])
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 8)
             
            }
            .frame(width: screen.size.width, height: screen.size.height)
            .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

