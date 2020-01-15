//
//  Person.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 15/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Person: Identifiable {
    let id: String
    let ref: DatabaseReference?
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
    let createdAt: Int
    let updatedAt: Int

    init(firstName: String, lastName: String, key: String = "", email: String, phoneNumber: String, createdAt: Int, updatedAt: Int) {
        self.ref = nil
        self.id = key
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject] else {
            return nil
        }

        self.ref = snapshot.ref
        self.id = snapshot.key
        self.firstName = value["firstName"] as? String ?? ""
        self.lastName = value["lastName"] as? String ?? ""
        self.email = value["email"] as? String ?? ""
        self.phoneNumber = value["phoneNumber"] as? String ?? ""
        self.createdAt = value["createdAt"] as? Int ?? 0
        self.updatedAt = value["updatedAt"] as? Int ?? 0
    }
}
