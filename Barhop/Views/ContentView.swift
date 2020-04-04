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
    
    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 29.8827, longitude: -97.9406))
    ]
    
    @State private var showCard = false
    @State private var showMenu = false
    @State private var bottomState = CGSize.zero
    @State private var showFull = false
    
    var menu: [Menu] = menuData
    
    var body: some View {
        ZStack {
            
//            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
//                .edgesIgnoringSafeArea(.all)
            
            MapView(annotations: $annotations).centerCoordinate(.init(latitude: 29.8827, longitude: -97.9406)).zoomLevel(17)
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                MenuView(showMenu: $showMenu, showFull: $showFull)
                Spacer()
            }
            .padding()
            
            VStack {
                //this toggle will be replaced by any bars or ppl they press on
                Text("show me this bar/person")
            }.foregroundColor(.blue)
                .onTapGesture {
                    self.showCard.toggle()
            }
            
            BottomCardView(bottomState: $bottomState, showFull: $showFull)
                //.background(Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)).opacity(showFull ? 1.0 : 0.6))
                .background(Blur())
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 20)
                .offset(x: 0, y: showCard ? 720 : screen.height)
                .offset(y: bottomState.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -680
                        }
                        if self.bottomState.height < -680 {
                            self.bottomState.height = -680
                        }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.showCard = false
                        }
                        if (self.bottomState.height < -80 && !self.showFull) || (self.bottomState.height < -750 && self.showFull) {
                            self.bottomState.height = -680
                            self.showFull = true
                        } else {
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    }
                )
            
            if showMenu {
                Color.black.opacity(0.02)
                .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.showMenu.toggle()
                }
                .animation(.none)
            }
            
            SideMenuView(menu: menu, showMenu: $showMenu)
                .animation(.easeInOut(duration: 0.2))
                .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)

        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


