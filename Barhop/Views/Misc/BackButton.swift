//
//  BackButton.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/12/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Image("Back Arrow").renderingMode(.template)
            .foregroundColor(Color.black)
        .frame(width: 47, height: 47)
            .background(Color.black.opacity(0.08))
        .cornerRadius(9)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
