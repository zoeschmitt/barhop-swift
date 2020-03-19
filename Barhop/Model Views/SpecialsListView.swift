//
//  barListView.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/9/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import SwiftUI

struct SpecialsListView: View {
    @ObservedObject var store = DataStore()
    var body: some View {
        
        List {
            Text("specials!!")
        }
    }
}

struct barListView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialsListView()
    }
}
