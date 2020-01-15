//
//  PersonDetailView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 15/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct PersonDetailView: View {
    var selectedDate: Date?

    var body: some View {
        Group {
            if selectedDate != nil {
                Text("\(selectedDate!, formatter: dateFormatter)")
            } else {
                Text("Detail view content goes here")
            }
        }.navigationBarTitle(Text("Detail"))
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView()
    }
}
