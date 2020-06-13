//
//  ReviewsListView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/15/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct ReviewContainerView: View {
    var review: Review
    
    var body: some View {
        
           HStack {
            
            Circle()
                .fill(Color.white.opacity(0.5))
                .frame(width: 50, height: 50)
                .padding(.vertical)
            
            VStack(alignment: .leading) {
                Text(review.title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .lineLimit(1)
                    
                Text(review.review)
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .lineLimit(3)
            }
            .foregroundColor(Color.white)
            .multilineTextAlignment(.leading)
            .padding(.leading, 2)
    
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .animation(.none)
    
    }
}

