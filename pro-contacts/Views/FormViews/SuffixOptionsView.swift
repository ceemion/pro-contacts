//
//  SuffixOptionsView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 16/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

struct SuffixOptionsView: View {
    @Binding var suffix: String
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(Constants.FormOptions.suffixes, id: \.self) { suffix in
                    Text(suffix)
                        .padding(10)
                        .onTapGesture {
                                self.suffix = suffix
                                self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .navigationBarTitle("Select Title", displayMode: .inline)
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

struct SuffixOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SuffixOptionsView(suffix: .constant(""))
    }
}
