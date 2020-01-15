//
//  PersonsView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 15/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct PersonsView: View {
    @Binding var data: [Person]

    var body: some View {
        List {
            ForEach(data, id: \.id) { person in
//                NavigationLink(
//                    destination: PersonDetailView(selectedContact: contact)
//                ) {
                Text(person.firstName)
//                }
            }
//            .onDelete { indices in
//                indices.forEach { self.dates.remove(at: $0) }
//            }
        }
    }
}

//struct PersonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonsView(dates: [Date])
//    }
//}
