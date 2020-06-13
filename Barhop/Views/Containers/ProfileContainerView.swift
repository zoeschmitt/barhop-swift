//
//  ProfileContainerView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/13/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct ProfileContainerView: View {
    let image: String
    let name: String
    var body: some View {
        HStack {
            VStack {
                Image(image)
                    .resizable()
            }
            .frame(width: 75, height: 75)
            .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
            .padding(.all, 15)
            
            Text(name)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(Color.black)
                .padding(.trailing, 15)
            
            Spacer()
        }
        .frame(width: screen.width - 50)
        .background(Color.black.opacity(0.08))
        .cornerRadius(14)
    }
}
