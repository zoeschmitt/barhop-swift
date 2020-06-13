//
//  FriendContainerView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/13/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct FriendContainerView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .frame(width: 25, height: 25)
                .background(Color.black.opacity(0.5))
                .padding(.all, 15)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Jane Doe")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.black)
                Text("At Green Parrot")
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .foregroundColor(Color.black.opacity(0.5))
            
            }
            .padding(.vertical, 15)
            
            Spacer()
            
            Image(systemName: "star.fill")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8742827773, blue: 0.2495279312, alpha: 1)))
            .padding(.trailing, 15)
        }
        .background(Color.black.opacity(0.08))
        .cornerRadius(9)
    }
}


