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
    var data: [Person]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(data, id: \.id) { person in
                    NavigationLink( destination: PersonDetailView(person: person) ) {
                        RowView(person: person)
                            .font(.body)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color("rows.bg")))
                    }
                }
            }
            .padding(.horizontal, 10)
            //.onDelete { indices in
            //    print("welcome")
            //}
        }
    }
}

struct RowView: View {
    let person: Person

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(person.firstName) \(person.lastName)")
                .foregroundColor(Color("text"))
                .font(Font.custom(Constants.Font.main, size: CGFloat(Constants.TextSizes.body)))

            HStack {
                Spacer()
            }.padding(2)

            SubRow(person: person)
        }
    }
}

struct SubRow: View {
    let person: Person

    var body: some View {
        Group {
            if person.company.isEmpty {
                Text(person.jobTitle)
            } else {
                Text("\(person.jobTitle), \(person.company)")
            }
        }
        .foregroundColor(Color("text").opacity(0.5))
        .font(Font.custom(Constants.Font.main, size: 10))
    }
}

struct PersonsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonsView(data: [Person.init(firstName: "", lastName: "", email: "", phoneNumber: "", createdAt: 0, updatedAt: 0)])
    }
}
