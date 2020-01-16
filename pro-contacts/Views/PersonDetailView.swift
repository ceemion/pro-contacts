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
    var person: Person

    var body: some View {
            Text(person.lastName)
                .navigationBarTitle(Text("\(person.firstName) \(person.lastName)"))
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.init(firstName: "", lastName: "", email: "", phoneNumber: "", createdAt: 0, updatedAt: 0))
    }
}
