//
//  CustomField.swift
//  Barhop
//
//  Created by Zoe Schmitt on 6/12/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct CustomField: View {
    let title: String
    let text: String
    @Binding var note: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .padding(.bottom, 10)
                    .foregroundColor(.black)
                
                Spacer()
            }
            HStack {
                TextField(text, text: $note)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .truncationMode(.middle)
                    .frame(width: screen.width - 90, alignment: .leading)
                    .padding(.vertical, 15)
            }
            .frame(width: screen.width - 50)
            .background(Color.black.opacity(0.08))
            .cornerRadius(10)
        }
        .padding(.bottom, 10)
    }
}


