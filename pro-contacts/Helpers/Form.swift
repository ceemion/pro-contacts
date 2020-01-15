//
//  Form.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 14/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import SwiftUI

public struct Label: View {
    let text: String

    public var body: some View {
        Text(text.uppercased())
            .font(Font.custom(Constants.Font.main, size: 10))
            .foregroundColor(Color("gray"))
            .tracking(0.5)
    }
}

public struct ProTextFieldStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(Font.custom(Constants.Font.main, size: 14))
            .foregroundColor(Color("text"))
            .padding()
            .background(Color("inputBg"))
            .cornerRadius(10)
    }
}

public struct FormError: View {
    let text: String

    public var body: some View {
        Group {
            if !text.isEmpty {
                Text(text)
                    .font(.footnote)
                    .foregroundColor(Color("danger"))
                    .padding(.vertical, 5)
            }
        }
    }
}
