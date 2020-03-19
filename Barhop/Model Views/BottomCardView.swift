//
//  BottomCardView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/5/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct BottomCardView: View {
    
    @Binding var bottomState: CGSize
    @Binding var showFull: Bool
    
    var body: some View {
        VStack(spacing: 20) {
        Rectangle()
            .frame(width: 60, height: 6)
            .cornerRadius(3)
            .opacity(0.5)
            .foregroundColor(Color.white)
            .onTapGesture {
                if self.showFull {
                    self.bottomState.height += 680
                    self.showFull = false
                } else {
                    self.bottomState.height = -680
                    self.showFull = true
                }
            }
            
            BarView(showFull: $showFull)
    
        Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
    }
}

struct BarView: View {

    @Binding var showFull: Bool
    @State var specialsList: Bool = true
    @State var reviewsList: Bool = false
    @State var photoList: Bool = false
    
var body: some View {
   
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 1) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Green Parrot")
                        .font(.system(size: 32, weight: .bold))
                        .animation(.linear)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: 30, height: 30)
                        
                        
                        Text("2.9")
                            .font(.system(size: 14, weight: .medium))
                        
                        Image(systemName: "hare.fill")
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: 30, height: 30)
                        
                        Text("5,998")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .foregroundColor(.white)
                    
                    Text("\(addy.street)\n \(addy.city), \(addy.state) \(addy.zip)")
                        .font(.caption)
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)

                Spacer()
                
                Image("GreenParrotImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: showFull ? 140 : 95, height: showFull ? 140 : 95)
            }
            
            //description text
            Text("The monk parakeet (Myiopsitta monachus), also known as the Quaker parrot, is a species of true parrot in the family Psittacidae. It is a small, bright-green parrot with a greyish breast and greenish-yellow abdomen.")
            .lineLimit(7)
            .font(.system(size: 16, weight: .medium))
            .font(.system(.caption))
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            
            HStack() {
                Button(action: {
                    self.reviewsList = false
                    self.photoList = false
                    self.specialsList = true
                }) {
                    Text("Specials")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .bold))
                }
                Spacer()
                Button(action: {
                    self.reviewsList = true
                    self.photoList = false
                    self.specialsList = false
                }) {
                    Text("Reviews")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .bold))
                }
                Spacer()
                Button(action: {
                    self.reviewsList = false
                    self.photoList = true
                    self.specialsList = false
                }) {
                    Text("Photos")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            

            if specialsList {
                SpecialsListView()
            }
            else if reviewsList {
                ReviewsListView()
            }
            else if photoList {
                PhotosListView()
            }
            
            //vstack with hstack of menu and list that hcanges depending on the menu item that is selected
        }
    .padding(.horizontal, 15)
    }
}

//struct BottomCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomCardView(bottomState: CGSize, showFull: true)
//    }
//}
