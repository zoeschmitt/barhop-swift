//
//  SpecialsView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 4/2/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct SpecialView: View {
    var special: Special
    var body: some View {
        
        HStack {
            Image(systemName: special.type == "drink" ? "sparkles" : "moon.stars.fill")
            .foregroundColor(Color.white)
            .font(.system(size: 18, weight: .bold))
            .frame(width: 50, height: 50)
            .background(Color.white.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.vertical)
            
            
            
            VStack(alignment: .leading) {
                Text(special.title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .lineLimit(1)
                    
                Text(special.description)
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


//struct SpecialsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecialView()
//    }
//}
