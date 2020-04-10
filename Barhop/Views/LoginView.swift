//
//  LoginView.swift
//  Barhop
//
//  Created by mac user on 4/4/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginView : View {
    @State var showDetails = false
    @State var username = "placeholder"
    @State var password = "placeholder"
    
    var body: some View{
        
        
        ZStack(){
            
            Color(red: 0.5, green: 0.5, blue: 0.5).edgesIgnoringSafeArea(.all)
                .frame(width: 500, height: 800)
            
        VStack{
            
            TextField("username", text: $username)
                .background(Color.white)
                .padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 10))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
            TextField("password", text: $password)
            .background(Color.white)
            .padding(EdgeInsets(top: 8, leading: 30, bottom: 8, trailing: 10))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 8)
            Button(action: {
                print("Logging In")
            }){
                Text("Login")
                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                    .background(Color.init(red: 242/255, green: 163/255, blue: 64/255))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 8)
            }
        }
        .padding()
        .background(Color.init(red: 0, green: 0, blue: 0))
        
            }
        }
}


