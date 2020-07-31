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
    @State var selected = 0
    
    @Binding var showFull: Bool
    @State var currentList: Int = 0
    @State var categorySelected = 0
    @State var username = ""
    @State var reviewTxt = ""
    
var body: some View {
    
    NavigationView {
        
   ScrollView(.vertical, showsIndicators: false) {
        
        VStack(alignment: .leading, spacing: 10) {
            
            BarInfoView(showFull: $showFull)
            
            Text("The monk parakeet (Myiopsitta monachus), also known as the Quaker parrot, is a species of true parrot in the family Psittacidae. It is a small, bright-green parrot with a greyish breast and greenish-yellow abdomen.")
            .lineLimit(7)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
        
                Topbar(selected: self.$selected)
            
            if self.selected == 0 {
                SpecialsView()
            }
            if self.selected == 1 {
                ReviewsView()
            }
            if self.selected == 2 {
                PhotosView()
            }
                
                Spacer()
            
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
 
struct Topbar: View {
    @Binding var selected : Int
    
    var body : some View {
        
        
        HStack {
            Button(action: {
                
                self.selected = 0
                
            }) {
                Text("Specials")
                    .frame(width: 25, height: 25)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(self.selected == 0 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 0 ? .pink : .white)
            
            Button(action: {
                
                self.selected = 1
                
            }) {
                Text("Reviews")
                    .frame(width: 25, height: 25)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(self.selected == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 1 ? .pink : .white)
            
            Button(action: {
                
                self.selected = 2
                
            }) {
                Text("Photos")
                    .frame(width: 25, height: 25)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(self.selected == 2 ? Color.white : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 2 ? .pink : .white)
        }.padding(8)
            .background(Color.gray)
            .clipShape(Capsule())
    }
}
 
struct SpecialsView : View {
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15){
                ForEach(1...8, id: \.self){ i in
                    
                    HStack(spacing: 15){
                        Text("These are my specials")
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("More text")
                            Text("Texty text")
                            } .padding()
                            .background(Color.white)
                    }
                    
                }
            } .padding()
        }
    }
}
 
struct ReviewsView : View {
    @State var username = ""
    @State var reviewTxt = ""
    
    var body : some View {
        Text("These are the reviews")
    }
}
 
struct PhotosView : View {
    @State var username = ""
    @State var reviewTxt = ""
    var body : some View {
        Text("These are the photos")
    }
}

