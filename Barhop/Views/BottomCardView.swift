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
    
    @ObservedObject var store = DataStore()
    @Binding var showFull: Bool
    @State var currentList: Int = 0
    
var body: some View {
   
        VStack(alignment: .leading, spacing: 10) {
            
            BarInfoView(showFull: $showFull)
            
            Text("The monk parakeet (Myiopsitta monachus), also known as the Quaker parrot, is a species of true parrot in the family Psittacidae. It is a small, bright-green parrot with a greyish breast and greenish-yellow abdomen.")
            .lineLimit(7)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            
            ListButtons(currentList: $currentList)
                .padding(.bottom, 20)
            
            BarScrollView(bar: store.bars[0], currentList: $currentList)

        }
        .frame(maxWidth: .infinity)
    .padding(.horizontal, 15)
    }
}

//struct BottomCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomCardView(bottomState: CGSize, showFull: true)
//    }
//}

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

struct ListButtons: View {
    
    @Binding var currentList: Int
    @State var line: CGFloat = CGFloat.zero
    private let listNames = ["Specials", "Reviews", "Photos"]
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                    Button(action: {
                        self.currentList = 0
                    }) {
                        Text("Specials")
                            .foregroundColor(self.currentList == 0 ? Color.white : Color.white.opacity(0.2))
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .overlay(self.currentList == 0 ? MyRectangle() : nil, alignment: .leading)
                    }

                    Spacer()

                    Button(action: {
                        self.currentList = 1
                    }) {
                        Text("Reviews")
                            .foregroundColor(self.currentList == 1 ? Color.white : Color.white.opacity(0.2))
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .overlay(self.currentList == 1 ? MyRectangle() : nil)
                    }

                    Spacer()

                    Button(action: {
                        self.currentList = 2
                    }) {
                        Text("Photos")
                            .foregroundColor(self.currentList == 2 ? Color.white : Color.white.opacity(0.2))
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .overlay(self.currentList == 2 ? MyRectangle() : nil)
                    }
                    
                }
                .padding(.top)
                .lineSpacing(.infinity)
                .animation(.none)
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
            .foregroundColor(.white)
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
