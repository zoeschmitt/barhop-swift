//
//  CreateAccountView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/12/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct CreateAccountView: View {
    @State var username: String = ""
      @State var password: String = ""
    @State var phone: String = ""
      @Binding var loggedIn: Bool
      @Environment(\.presentationMode) var presentationMode
      var body: some View {
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
              .padding(.horizontal, 25)
              
              Text("Sign Up")
                  .padding(.top, 55)
                  .foregroundColor(.black)
              
              Spacer()
              
              
              VStack {
                  CustomField(title: "Username", text: "username", note: $username)
                      
                  CustomField(title: "Password", text: "password", note: $password)
                
                CustomField(title: "Phone Number", text: "phone number", note: $phone)
                  
                  Button(action: {
                      self.loggedIn = true
                  }) {
                      Text("Sign Up")
                      .font(.system(size: 18, weight: .semibold, design: .rounded))
                      .foregroundColor(.black)
                      .frame(width: screen.width - 50)
                      .padding(.vertical, 15)
                      .background(Color.white)
                      .cornerRadius(9)
                      .shadow(color: Color.black.opacity(0.08), radius: 15, x: 0, y: 0)
                  }
                  
              }
              .padding(.bottom, 50)
              .padding(.horizontal, 25)
              
    
          }
          .padding(.vertical, 55)
          .navigationBarTitle("")
          .navigationBarBackButtonHidden(true)
          .navigationBarHidden(true)
          .background(Color.white)
          .edgesIgnoringSafeArea(.all)
      }
}

