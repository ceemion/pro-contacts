//
//  Country.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 20/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Country: Hashable {
    let name: String
    let countryCode: String
    let phoneCode: Int

    init(name: String, cc: String, pc: Int) {
        self.name = name
        self.countryCode = cc
        self.phoneCode = pc
    }

    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject] else {
            return nil
        }

        self.name = value["name"] as? String ?? ""
        self.countryCode = value["countryCode"] as? String ?? ""
        self.phoneCode = value["phoneCode"] as? Int ?? 0
    }
}
