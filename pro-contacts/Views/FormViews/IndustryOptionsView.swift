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

    var body: some View {
        NavigationView {
            List {
                ForEach(Constants.FormOptions.industries, id: \.self) { industry in
                    Text(industry)
                        .padding(10)
                        .onTapGesture {
                                self.industry = industry
                                self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
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

struct IndustryOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        IndustryOptionsView(industry: .constant(""))
    }
}
