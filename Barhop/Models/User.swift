//
//  User.swift
//  Barhop
//
//  Created by Zoe Schmitt on 1/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

struct User: Identifiable {
    var id = UUID()
    let userId: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
    let friends: [User]
    let bestFriends: [User]
    let favoritesBars: [Bar]
    let showLocation: Bool
   // let location: CLLocationCoordinate2D
}
