//
//  barListView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/9/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct BarScrollView: View {
    let bar: Bar
    @Binding var currentList: Int
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if currentList == 1 {
                ForEach(bar.reviews.indices, id: \.self) { index in
                    ReviewView(review: self.bar.reviews[index])
                }
            }
            else if currentList == 2 {
                
            } else {
                ForEach(bar.specials.indices, id: \.self) { index in
                    SpecialView(special: self.bar.specials[index])
                }
            }
            
        }
        .padding(.top, 20)
    
    }
}


//struct barListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpecialsList()
//    }
//}
