//
//  Functions.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 20/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import UIKit

class Functions {
    func phoneCallAction(_ n: String) {
        if let number = URL(string: "tel://\(n)") {
            if UIApplication.shared.canOpenURL(number) {
                UIApplication.shared.open(number, options: [:], completionHandler: nil)
            }
        }
    }

    func openUrl(_ u: String) {
        if let url = URL(string: u) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }

    func openSocialUrl(_ t: String, _ u: String) {
        var mapped = u

        if t == "skype" {
            mapped = "live:\(u)"
        } else if t == "linkedin" {
            mapped = "https://www.linkedin.com/in/\(u)"
        }

        if let url = URL(string: mapped) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}
