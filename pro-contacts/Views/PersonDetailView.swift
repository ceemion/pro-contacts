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
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color("gray"))
                        .frame(width: 100, height: 100, alignment: .center)
                    Text("JA")
                        .font(Font.custom("HelveticaNeue-Medium", size: 40))
                        .foregroundColor(Color.white)
                }

                Text("\(person.suffix) \(person.firstName) \(person.lastName)")

                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "mappin")
                    Text(person.country)
                }
            }
        }
//        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(
            trailing: NavigationLink(destination: PersonFormView(), label: {
                Text("Edit")
            })
        )
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person: Person.init(firstName: "", lastName: "", email: "", phoneNumber: "", createdAt: 0, updatedAt: 0))
    }
}
