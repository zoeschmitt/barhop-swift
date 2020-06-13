//
//  Title.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/12/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct Title: View {
    let title: String
    var body: some View {
        HStack {
            VStack() {
                Text(title)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.black)
            }
            Spacer()
        }
    }
}

