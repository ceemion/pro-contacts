//
//  User.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 14/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation

class User {
    var uid: String
    var name: String
    var email: String
    var phone: String

    init(uid: String, name: String, email: String, phone: String) {
        self.uid = uid
        self.name = name
        self.email = email
        self.phone = phone
    }
}
