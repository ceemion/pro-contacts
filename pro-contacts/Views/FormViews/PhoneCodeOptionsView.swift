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
    
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                SearchBar(text: $searchText, placeholder: "Search countries")

                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(self.countries.filter {
                        self.searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchText)
                    }, id: \.self) { country in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .center, spacing: 10) {
                                Text(country.name)
                                    .foregroundColor(Color("text"))
                                    .font(Font.custom(Constants.Font.main, size: CGFloat(Constants.TextSizes.small)))
                                Spacer()
                                Text("+\(String(country.phoneCode))")
                                    .foregroundColor(Color("text"))
                                    .font(Font.custom(Constants.Font.main, size: CGFloat(Constants.TextSizes.small)))
                            }
                            .padding(10)
                        }
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("rows.bg")))
                        .onTapGesture {
                            self.code = "+\(String(country.phoneCode))"
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .padding(.horizontal, 10)
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
}

struct PhoneCodeOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCodeOptionsView(countries: [Country.init(name: "", cc: "", pc: 0)], code: .constant(""))
    }
}
