//
//  BarView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 4/3/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI
import Firebase


struct BarView: View {
    //Variables
    var selectedCategory = "reviews"
    
    //@Binding var bar: Bar
    @Binding var showFull: Bool
    @State var currentList: Int = 0
    @State var categorySelected = 0
    @State var username = ""
    @State var reviewTxt = ""
    
var body: some View {
    NavigationView {
   
        VStack(alignment: .leading, spacing: 10) {
            
            BarInfoView(showFull: $showFull)
            
            Text("The monk parakeet (Myiopsitta monachus), also known as the Quaker parrot, is a species of true parrot in the family Psittacidae. It is a small, bright-green parrot with a greyish breast and greenish-yellow abdomen.")
            .lineLimit(7)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            
   //         ListButtons(currentList: $currentList) //casualty of segmented control
   //         .padding(.bottom, 20)
            //Segmented Controller
            Picker(selection: $categorySelected, label: Text("")) {
                Text("Specials").tag(0)
                Text("Reviews").tag(1)
                Text("Photos").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
            
            TextField("Username", text: $username)
            
            TextField("Add Review Here", text: $reviewTxt)
            
            Button(action: {
                Firestore.firestore().collection("reviews").addDocument(data: [
                    "numComments" : 0,
                    "numLikes": 0,
                    "reviewTxt": self.reviewTxt,
                    "timeStamp" : FieldValue.serverTimestamp(),
                    "username" : self.username
                ]) { (err) in
                    if let err = err {
                        debugPrint("Error adding document: \(err)")
                    } else {
                        return //TODO... might not need to do any
                    }
                }
                }) {
                    Text("Post")
            }
            
            
        }
        .frame(maxWidth: .infinity)
    .padding(.horizontal, 15)
        }
    }
}


struct MyRectangle : View {
    var body: some View {
        GeometryReader { g in
            Rectangle()
                .frame(width: g.size.width / 2, height: 4)
                .offset(x: -g.size.width/4, y: g.size.height)
                .foregroundColor(.white)
                .animation(.linear)
        }
    }
}

//struct ListButtons: View {
//
//    @Binding var currentList: Int
//    @State var line: CGFloat = CGFloat.zero
//    private let listNames = ["Specials", "Reviews", "Photos"]
//
//    var body: some View {
//        VStack {
//            HStack(alignment: .top) {
//                    Button(action: {
//                        self.currentList = 0
//                    }) {
//                        Text("Specials")
//                            .foregroundColor(self.currentList == 0 ? Color.white : Color.white.opacity(0.2))
//                            .font(.system(size: 24, weight: .bold, design: .rounded))
//                            .overlay(self.currentList == 0 ? MyRectangle() : nil, alignment: .leading)
//                    }
//
//
//                    Spacer()
//                VStack{
//                    Button(action: {
//                        self.currentList = 1
//                    }) {
//                        Text("Reviews")
//                            .foregroundColor(self.currentList == 1 ? Color.white : Color.white.opacity(0.2))
//                            .font(.system(size: 24, weight: .bold, design: .rounded))
//                            .overlay(self.currentList == 1 ? MyRectangle() : nil)
//                        Button(action: {
//                            print("Weee")
//                        }) {
//                            Text("Push")
//                        }
//                    }
//                }
//
//                    Spacer()
//
//                    Button(action: {
//                        self.currentList = 2
//                    }) {
//                        Text("Photos")
//                            .foregroundColor(self.currentList == 2 ? Color.white : Color.white.opacity(0.2))
//                            .font(.system(size: 24, weight: .bold, design: .rounded))
//                            .overlay(self.currentList == 2 ? MyRectangle() : nil)
//                    }
//
//                }
//                .padding(.top)
//                .lineSpacing(.infinity)
//                .animation(.none)
//        }
//
//    }
//}

struct BarInfoView: View {
    @Binding var showFull: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 1) {
            VStack(alignment: .leading, spacing: 3) {
                Text("Green Parrot")
                    .animation(.linear)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 30, height: 30)
                    
                    Text("2.9")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                    
                    Image(systemName: "heart.fill")
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 30, height: 30)
                        
                    
                    Text("5,998")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                }
                .foregroundColor(.white)
                
                Text("\(addy.street)\n \(addy.city), \(addy.state) \(addy.zip)")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
            }
            .multilineTextAlignment(.leading)
            
            Spacer()
            
            //eventually add a geometry reader to this for image resizing
            Image("GreenParrotImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: showFull ? 120 : 85, height: showFull ? 120 : 85)
        }
    }
}
