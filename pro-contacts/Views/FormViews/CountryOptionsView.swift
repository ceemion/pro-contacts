//
//  CountryOptionsView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 20/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct CountryOptionsView: View {
    var countries: [Country]

    @Binding var country: String
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(self.countries, id: \.self) { country in
                    Text(country.name)
                        .padding(10)
                        .onTapGesture {
                            self.country = country.name
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .navigationBarTitle("Select Country", displayMode: .inline)
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

struct CountryOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryOptionsView(countries: [Country.init(name: "", cc: "", pc: 0)], country: .constant(""))
    }
}
