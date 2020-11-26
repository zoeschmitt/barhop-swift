//
//  HomeView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/11/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI
import Mapbox
import Firebase 

struct HomeView: View {
//    @State var annotations: [MGLPointAnnotation] = [
//        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 29.8827, longitude: -97.9406))
//    ]
    
    @Binding var showCard: Bool
    @State private var showMenu = false
    @State private var bottomState = CGSize.zero
    @State var name = ""
    @Binding var showFull: Bool

    var body: some View {
        
        ZStack {
            
            //location sharing add signIn/SignUp here
            NavigationView {
                
                VStack {
                    
                    TextField("Enter name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    if name != "" {
                        
                        NavigationLink(destination: mapView(name: self.name).navigationBarTitle("", displayMode: .inline)) {
                            
                            Text("Share location")
                        }
                    }
                    }.padding()
                    .navigationBarTitle("Location Sharing")
            }
            
            VStack {
                
                Homescreen()
                
                Spacer()
                
                MenuView(showFull: $showFull)
                    .padding(.top, 25)
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
                .offset(x: 0, y: showCard ? screen.height - 250 : screen.height)
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
        }
        
    }
}


struct Homescreen : View {
    
    var body: some View {
        
        VStack {
            
            Button(action: {
                
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            
            }) {
                Text("Log out")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color(.blue))
            .cornerRadius(10)
            .padding(.top,25)
            
        }
        
    }
}
