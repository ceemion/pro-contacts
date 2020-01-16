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
    let suffix: String
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
    let website: String
    let industry: String
    let company: String
    let department: String
    let jobTitle: String
    let workEmail: String
    let workPhoneNumber: String
    let skype: String
    let linkedin: String
    let github: String
    let medium: String
    let twitter: String
    let facebook: String
    let instagram: String
    let notes: String
    let createdAt: Int
    let updatedAt: Int

    init(firstName: String, lastName: String, key: String = "", email: String, phoneNumber: String, createdAt: Int, updatedAt: Int) {
        self.ref = nil
        self.id = key
        self.suffix = ""
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.website = ""
        self.industry = ""
        self.company = ""
        self.department = ""
        self.jobTitle = ""
        self.workEmail = ""
        self.workPhoneNumber = ""
        self.skype = ""
        self.linkedin = ""
        self.github = ""
        self.medium = ""
        self.twitter = ""
        self.facebook = ""
        self.instagram = ""
        self.notes = ""
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject] else {
            return nil
        }

        self.ref = snapshot.ref
        self.id = snapshot.key
        self.suffix = value["suffix"] as? String ?? ""
        self.firstName = value["firstName"] as? String ?? ""
        self.lastName = value["lastName"] as? String ?? ""
        self.email = value["email"] as? String ?? ""
        self.phoneNumber = value["phoneNumber"] as? String ?? ""
        self.website = value["website"] as? String ?? ""
        self.industry = value["industry"] as? String ?? ""
        self.company = value["company"] as? String ?? ""
        self.department = value["department"] as? String ?? ""
        self.jobTitle = value["jobTitle"] as? String ?? ""
        self.workEmail = value["workEmail"] as? String ?? ""
        self.workPhoneNumber = value["workPhoneNumber"] as? String ?? ""
        self.skype = value["skype"] as? String ?? ""
        self.linkedin = value["linkedin"] as? String ?? ""
        self.github = value["github"] as? String ?? ""
        self.medium = value["medium"] as? String ?? ""
        self.twitter = value["twitter"] as? String ?? ""
        self.facebook = value["facebook"] as? String ?? ""
        self.instagram = value["instagram"] as? String ?? ""
        self.notes = value["notes"] as? String ?? ""
        self.createdAt = value["createdAt"] as? Int ?? 0
        self.updatedAt = value["updatedAt"] as? Int ?? 0
    }
}
