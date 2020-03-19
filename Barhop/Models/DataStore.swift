//
//  DataStore.swift
//  Barhop
//
//  Created by Zoe Schmitt on 2/15/20.
//  Copyright © 2020 Zoe Schmitt. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

//class Api {
//    func getPosts(completion: @escaping ([Post]) -> ()) {
//        let url = URL(string: "https://uinames.com/api/?amount=5")!
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//
//            let posts = try! JSONDecoder().decode([Post].self, from: data!)
//            DispatchQueue.main.async {
//                completion(posts)
//            }
//        }
//        .resume()
//    }
//}

class DataStore: ObservableObject {
    @Published var bars: [Bar] = [Bar(barId: "001", name: "Vodka Street", description: "Bar on the square", address: Address(street: "univ drive", city: "San Marcos", state: "TX", zip: "78666", country: "USA"), rating: "2", specials: specials , reviews: reviews, phoneNumber: "210 238 2199"),
    Bar(barId: "002", name: "Harpers", description: "Original Rooftop Bar", address: Address(street: "univ drive", city: "San Marcos", state: "TX", zip: "78666", country: "USA"), rating: "2",specials: specials , reviews: reviews, phoneNumber: "210 238 2199")]
    @Published var currentUser = User(id: UUID(), userId: "1", firstName: "Zoe", lastName: "Schmitt", phoneNumber: "(210) - 383 - 7022", email: "zoeschmitt@hotmail.com", friends: friends, bestFriends: [], favoritesBars: [], showLocation: false)

//    init() {
//        fetchPosts()
//    }
//
//    func fetchPosts() {
//        Api().getPosts { (posts) in
//            self.posts = posts
//        }
//    }
}

let friends = [
    User(id: UUID(), userId: "2", firstName: "Jack", lastName: "Smith", phoneNumber: "(210) - 749 - 9129", email: "jacksmith@gmail.com", friends: [], bestFriends: [], favoritesBars: [], showLocation: false)
]

let reviews = [
    Review(review: "bad", title: "bad rating", rating: "1")
]

let specials = [
    Special(title: "$2 shots", description: "$2 shots all night", type: "drink")
]

