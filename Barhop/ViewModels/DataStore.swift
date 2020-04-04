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

//make a different observable object for the user

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
    @Published var bars: [Bar] = [Bar(name: "Vodka Street", description: "Bar on the square", address: Address(street: "univ drive", city: "San Marcos", state: "TX", zip: "78666"),lat: " ", long: " ", rating: "2", specials: specials , reviews: reviews, phoneNumber: "210 238 2199"),
    Bar(name: "Harpers", description: "Original Rooftop Bar", address: Address(street: "univ drive", city: "San Marcos", state: "TX", zip: "78666"), lat: " ", long: " ", rating: "2",specials: specials , reviews: reviews, phoneNumber: "210 238 2199")]
    @Published var currentUser = User(firstName: "Zoe", lastName: "Schmitt", phoneNumber: "(210) - 383 - 7022", email: "zoeschmitt@hotmail.com", friends: friends, favoriteBars: [], showLocation: false)

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
    User(firstName: "Jack", lastName: "Smith", phoneNumber: "(210) - 749 - 9129", email: "jacksmith@gmail.com", friends: [], favoriteBars: [], showLocation: false)
]

let reviews = [
    Review(title: "Great bar!!", review: "They have good drinks.", rating: "5"),
    Review(title: "Good specials", review: "It's a decent bar with great specials, they could use more bartenders though.", rating: "4"),
    Review(title: "Good food for a bar", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.", rating: "5"),
    Review(title: "Lorem ipsum dolor", review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.", rating: "1"),
]

let specials = [
    Special(title: "$2 shots", description: "$2 shots all night", type: "drink"),
    Special(title: "$4 margs happy hour!", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", type: "drink"),Special(title: "shotssss", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.", type: "drink"),Special(title: "$5 burgers", description: "Come get $5 burgers with your drinks!", type:"food"),Special(title: "Lorem ipsum", description: "dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt", type: "drink"),Special(title: "Lorem ipsum", description: "dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt dolor sit amet, consectetur adipiscing elit", type: "drink"),Special(title: "Lorem ipsum", description: "dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt", type: "drink")
]

