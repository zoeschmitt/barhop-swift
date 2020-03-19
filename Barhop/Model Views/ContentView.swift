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

let addy: Address = Address(street: "124 N Lyndon B Johnson Dr", city: "San Marcos", state: "TX", zip: "78666", country: "United States")

struct ContentView: View {
    
    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 37.791434, longitude: -122.396267))
    ]
    
    @State var showCard = false
    @State var showMenu = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    var menu: [Menu] = menuData
    
    var body: some View {
        ZStack {
            
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            MapView(annotations: $annotations).centerCoordinate(.init(latitude: 37.791293, longitude: -122.396324)).zoomLevel(16)
            .edgesIgnoringSafeArea(.all)
        
            VStack {
                MenuView(showMenu: $showMenu)
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
                .background(Color(#colorLiteral(red: 0.0731209591, green: 0.00916066207, blue: 0.2253128886, alpha: 1)).opacity(showFull ? 1.0 : 0.6))
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
            
                Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.showMenu.toggle()
                }
                .animation(.none)
                
            }
            
            SideMenuView(menu: menu)
                .rotation3DEffect(Angle(degrees: showMenu ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
                .animation(.easeInOut(duration: 0.3))
                .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
                .onTapGesture {
                    self.showMenu.toggle()
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


