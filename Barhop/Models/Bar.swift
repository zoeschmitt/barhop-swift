//
//  Bar.swift
//  Barhop
//
//  Created by Zoe Schmitt on 1/30/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import UIKit
import CoreLocation
import Combine


struct Bar: Identifiable {
    var id = UUID()
    let barId: String
    let name: String
    let description: String
    let address: Address
    //let location: CLLocationCoordinate2D
    let rating: String
    let specials: [Special]
    //let photos: [UIImage]
    let reviews: [Review]
    let phoneNumber: String
}

struct Review {
    let review: String
    let title: String
    let rating: String
    //let user: User
}

struct Address {
    let street: String
    let city: String
    let state: String
    let zip: String
    let country: String
}

struct Special {
    let title: String
    let description: String
    let type: String
}
