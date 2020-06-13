//
//  TitleWithSub.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/13/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct TitleWithSub: View {
    let title: String
    let subTitle: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.black)
                Text(subTitle)
                    .font(.system(size: 15, weight: .regular, design: .serif))
                    .foregroundColor(Color.black.opacity(0.5))
            }
            Spacer()
        }
    }
}

