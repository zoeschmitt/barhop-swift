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
        VStack(spacing: CGFloat(20)) {
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

