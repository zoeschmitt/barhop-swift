//
//  ContentView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 1/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//
import SwiftUI
import Mapbox
import Firebase

let screen = UIScreen.main.bounds

let addy: Address = Address(street: "124 N Lyndon B Johnson Dr", city: "San Marcos", state: "TX", zip: "78666")

struct ContentView: View  {
    var body: some View {
        Home()
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

struct Home: View {
    
    @State var showFull = false
    @State var showCard = false
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if self.status {
                    
                    HomeView(showCard: $showCard, showFull: $showFull)
                    } else {
                    
                        ZStack {
                        
                            NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                            
                                Text("")
                        }
                        .hidden()
                        
                        Login(show: self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct Login: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    
    var body: some View {
       
        ZStack {
            
            ZStack(alignment: .topTrailing) {
                       GeometryReader{_ in
                           VStack{
                               
                            //todo: Put Image LOGO here
                            
                               Text("Login to your account")
                                   .font(.title)
                                   .fontWeight(.bold)
                                   .foregroundColor(self.color)
                                   .padding(.top, 35)
                               
                               TextField("Email", text: self.$email)
                               .autocapitalization(.none)
                               .padding()
                               .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                               .padding(.top, 25)
                               
                            HStack(spacing: 15){
                                   
                                VStack {
                                    
                                       if self.visible {
                                        
                                           TextField("Password", text: self.$password)
                                           .autocapitalization(.none)
                                       } else {
                                           SecureField("Password", text: self.$password)
                                           .autocapitalization(.none)
                                       }
                                   }
                                   
                                   Button(action: {
                                    
                                       self.visible.toggle()
                                   }) {
                                    
                                       Image(systemName: self.visible ? "eye.fill" : "eye.slash.fill")
                                           .foregroundColor(Color.white)
                                   }
                                   
                               }
                               .padding()
                               .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color(.white) : self.color, lineWidth: 2))
                               .padding(.top, 25)
                            
                               HStack{
                                
                                   Spacer()
                                   
                                   Button(action: {
                                       
                                    self.reset()
                                    
                                   }) {
                                    
                                       Text("Forget Password")
                                           .fontWeight(.bold)
                                           .foregroundColor(Color.white)
                                   }
                               }
                               .padding(.top, 20)
                               
                                       Button(action: {
                                        
                                            self.verify()
                                       }) {
                                        
                                           Text("Login")
                                               .foregroundColor(.white)
                                               .padding(.vertical)
                                               .frame(width: UIScreen.main.bounds.width - 50)
                                       }
                                       .background(Color(.blue))
                                       .cornerRadius(10)
                                       .padding(.top, 25)
                           }
                           .padding(.horizontal, 25)
                       }
                       
                       Button(action: {
                           
                           self.show.toggle()
                           
                       }) {
                        
                           Text("Register")
                               .fontWeight(.bold)
                               .foregroundColor(Color.gray)
                       }
                   .padding()
                   }
            
            if self.alert {
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func verify() {
        
        if self.email != "" && self.password != "" {
            
            Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                
            }
            
        } else {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
    
    func reset() {
        
        if self.email != "" {
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil {
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
                
            }
        } else {
            
            self.error = "Email ID is empty"
            self.alert.toggle()
        }
    }
}

struct SignUp: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack{
            
            ZStack(alignment: .topLeading) {
                GeometryReader{_ in
                    VStack{
                        
                        Text("Login to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                        .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.visible {
                                    TextField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                } else {
                                    SecureField("Password", text: self.$password)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.fill": "eye.slash.fill")
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.revisible {
                                    TextField("Re-enter", text: self.$repassword)
                                    .autocapitalization(.none)
                                } else {
                                    SecureField("Re-enter", text: self.$repassword)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                self.revisible.toggle()
                            }) {
                                Image(systemName: self.revisible ? "eye.fill": "eye.slash.fill")
                                    .foregroundColor(Color.white)
                            }
                            
                        }
                        
                                Button(action: {
                        
                                    self.register()
                                    
                                }) {
                                    Text("Register")
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 50)
                                }
                    }
                    .padding(.horizontal, 25)
                }
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color.gray)
                }
            .padding()
            }
            
            if self.alert {
                
                ErrorView(alert: self.$alert, error: self.$error)
                
            }
            
        }
    .navigationBarBackButtonHidden(true)
    }
    
    func register() {
        
        if self.email != "" {
            if self.password == self.repassword {
                
                Auth.auth().createUser(withEmail: self.email, password: self.password) { (res, err) in
                    
                    if err != nil {
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    print("success")
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    
                }
                
            } else {
                
                self.error = "Password mismatch"
                self.alert.toggle()
            }
        }
        else {
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}



struct ErrorView : View {

    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error : String

//TODO fix the error view to give the error in the center of the screen
    var body : some View {
        
        VStack {
        
        GeometryReader{ _ in
            

            
               VStack{
                    
                        Text(self.error == "RESET" ? "Message" : "Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)

                    Spacer()
                
                .padding(.horizontal, 25)

            Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)

                Button(action: {

                    self.alert.toggle()
                    
                }) {
                    Text(self.error == "RESET" ? "Ok" : "Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color.pink)
            .cornerRadius(10)
                .padding(.top, 25)
               }
                    
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
        .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}


}
