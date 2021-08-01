//
//  User.swift
//  FriendFace
//
//  Created by Nick Rice on 29/07/2021.
//

import Foundation

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name
    }
    
    var formattedDate: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter.string(from: registered)
        }
    }
}



