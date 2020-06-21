//
//  ProfileView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/13/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var selected: String = "friends"
    @State var friendsWidth: CGFloat = .zero
    @State var favBarsWidth: CGFloat = .zero
    @State var barLocation: CGFloat = 0
    @State var barWidth: CGFloat = 45.0
    var body: some View {
        NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Spacer()
                    
                    NavigationLink(
                    destination: SettingsView()) {
                        Image(systemName: "gear")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.black)
                    }
                }
                .padding(.bottom, 20)
                .padding(.top, 55)
                
                VStack {
                    Image("mike").renderingMode(.original)
                        .resizable()
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
                .aspectRatio(contentMode: .fill)
                .padding(.bottom, 20)
                
                VStack {
                         HStack(alignment: .center) {
                             Text("Best Friends")
                                 .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.black)
                                 .padding(.trailing, 15)
                                 .overlay(GeometryReader { geo in
                                     Color.white.opacity(0.0001)
                                     .onAppear() {
                                         self.friendsWidth = geo.size.width
                                     }
                                     .onTapGesture {
                                         self.selected = "friends"
                                         self.barLocation = 0
                                         self.barWidth = self.friendsWidth / 2
                                     }
                                 })
                             
                             Text("Favorite Bars")
                                 .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.black)
                                 .padding(.trailing, 15)
                                 .overlay(GeometryReader { geo in
                                     Color.white.opacity(0.0001)
                                     .onAppear() {
                                         self.favBarsWidth = geo.size.width
                                     }
                                     .onTapGesture {
                                         self.selected = "bars"
                                         self.barLocation = self.friendsWidth + 8
                                         self.barWidth = self.favBarsWidth / 2
                                     }
                                 })
                
                             Spacer()
                         }
                    HStack {
                        HStack {
                                 Color.black
                        }
                        .frame(width: barWidth, height: 4)
                         .cornerRadius(1)
                         .padding(.leading, barLocation)
                         .animation(.interactiveSpring())
                        
                         Spacer()
                    }
                     }
                    .padding(.bottom, 25)
                
                VStack {
                    if selected == "bars" {
                        ForEach(0..<3) { index in
                        FriendContainerView()
                            .padding(.bottom, 5)
                        }
                    } else {
                    ForEach(0..<10) { index in
                    FriendContainerView()
                        .padding(.bottom, 5)
                    }
                    }
                }
                .padding(.bottom, 55)
            }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 55)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)

        }
        
    }
}


