//
//  SettingsButton.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/12/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct SettingsButton: View {
    let setting: Setting
    var body: some View {
        HStack {
            Image(systemName: setting.icon)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .padding(.all, 5)
                .foregroundColor(Color.black)
                .frame(width: 47, height: 47)
                .background(Color.black.opacity(0.08))
                .cornerRadius(10)
            
            Text(setting.title)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(Color.black)
                .padding(.trailing, 5)
                .padding(.leading, 10)
            
            Spacer()
        }
    }
}

