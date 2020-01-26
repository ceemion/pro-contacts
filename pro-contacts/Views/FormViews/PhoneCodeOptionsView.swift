//
//  PhoneCodeOptionsView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 26/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct PhoneCodeOptionsView: View {
    var countries: [Country]

    @Binding var code: String
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(self.countries, id: \.self) { country in
                    HStack(alignment: .center, spacing: 10) {
                        Text(country.name)
                        Spacer()
                        Text("+\(String(country.phoneCode))")
                    }
                    .padding(10)
                    .onTapGesture {
                        self.code = "+\(String(country.phoneCode))"
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Select Country Phone Code", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) { Image(systemName: "xmark")
                .imageScale(.medium)
                .padding(.vertical)
            }
                .accentColor(Color("primary"))
            )
        }
    }
}

struct PhoneCodeOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCodeOptionsView(countries: [Country.init(name: "", cc: "", pc: 0)], code: .constant(""))
    }
}
