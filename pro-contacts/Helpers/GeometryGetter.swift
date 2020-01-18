//
//  GeometryGetter.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 18/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import Foundation
import SwiftUI

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    self.rect = geometry.frame(in: .global)
                }

                return AnyView(Color.clear)
            }
        }
    }
}
