//
//  IndustryOptions.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 16/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct IndustryOptionsView: View {
    @Binding var industry: String
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                SearchBar(text: $searchText, placeholder: "Search industries")

                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(Constants.FormOptions.industries.filter {
                        self.searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchText)
                    }, id: \.self) { industry in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack { Spacer() }
                            Text(industry)
                                .foregroundColor(Color("text"))
                                .font(Font.custom(Constants.Font.main, size: CGFloat(Constants.TextSizes.small)))
                            HStack { Spacer() }
                        }
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("rows.bg")))
                        .onTapGesture {
                            self.industry = industry
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                .padding(.horizontal, 10)
                .navigationBarTitle("Select Industry", displayMode: .inline)
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

struct IndustryOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        IndustryOptionsView(industry: .constant(""))
    }
}
