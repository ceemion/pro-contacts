//
//  ContentView.swift
//  pro-contacts
//
//  Created by Fiyinfoluwa Adebayo on 13/01/2020.
//  Copyright © 2020 Kompilab Limited. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @State private var dates = [Date]()
    
    @EnvironmentObject var session: FirebaseSession

    var body: some View {
        Group {
            if session.currentUser != nil {
                NavigationView {
                    MasterView(dates: $dates)
                        .navigationBarTitle(Text("ProContacts"))
                        .navigationBarItems(
                            leading: EditButton(),
                            trailing: HStack {
                                Button(
                                    action: {
                                        withAnimation { self.session.logout() }
                                    }
                                ) {
                                    Image(systemName: "power")
                                        .padding()
                                }
                                Button(
                                    action: {
                                        withAnimation { self.dates.insert(Date(), at: 0) }
                                    }
                                ) {
                                    Image(systemName: "plus")
                                }
                            }
                        )
                    DetailView()
                }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            } else {
                LandingView()
            }
        }
        .onAppear(perform: getUser)
    }

    func getUser() {
        session.listen()
    }
}

struct MasterView: View {
    @Binding var dates: [Date]

    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                NavigationLink(
                    destination: DetailView(selectedDate: date)
                ) {
                    Text("\(date, formatter: dateFormatter)")
                }
            }.onDelete { indices in
                indices.forEach { self.dates.remove(at: $0) }
            }
        }
    }
}

struct DetailView: View {
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
