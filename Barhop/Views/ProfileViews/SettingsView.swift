//
//  SettingsView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/11/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    let settings: [Setting] = [Setting(title: "Location Settings", icon: "mappin.circle.fill"), Setting(title: "Share", icon: "square.and.arrow.up.fill"), Setting(title: "App Feedback", icon: "text.bubble.fill"), Setting(title: "Logout", icon: "arrow.left.square.fill")]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                VStack {
                        HStack {
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    BackButton()
                                }
                                Spacer()
                            }
                            .padding(.bottom, 20)
                        
                        
                        Title(title: "Settings")
                            .padding(.bottom, 20)
                    
                        ProfileContainerView(image: "mike", name: "Your Profile")
                        
                        VStack {
                                ForEach(0..<settings.count) { index in
                                    SettingsButton(setting: self.settings[index])
                            }
                        }
                    
                    Spacer()
                    
                }
                .edgesIgnoringSafeArea(.all)
                .padding(.horizontal, 25)
                .padding(.top, 100)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(width: screen.width, height: screen.height)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

