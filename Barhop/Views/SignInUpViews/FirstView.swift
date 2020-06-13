//
//  FirstView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/12/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    @Binding var loggedIn: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                
                VStack {
                 Text("Barhop Bitch")
                   .font(.system(size: 34, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top, 55)
                    
                Spacer()
                    
                    VStack {
                        NavigationLink(
                    destination: SignInView(loggedIn: $loggedIn)) {
                        Text("Sign In")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                        .frame(width: screen.width - 50)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .cornerRadius(9)
                        .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 0)
                    }
                        .padding(.bottom, 10)
                        
                        NavigationLink(
                        destination: CreateAccountView(loggedIn: $loggedIn)) {
                            Text("Create Account")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                                .foregroundColor(.black)
                                .frame(width: screen.width - 50)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(9)
                                .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 0)
                        }
                    }
                    .padding(.bottom, 55)
                
                
                
            }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }//z
            .edgesIgnoringSafeArea(.all)
    }//nav
    }
}

