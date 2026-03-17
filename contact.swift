//
//  contact.swift
//  trainning
//
//  Created by Harshit Raj on 28/12/25.
//
import SwiftUI
struct Contact: Identifiable{
    let id = UUID()
    let name: String
    let jobTitle: String
    let email: String
    let phoneNumber: String
}
struct ContactList: View{
        let contacts: [Contact] = [
            Contact(
                name: "Rahul Sharma",
                jobTitle: "iOS Developer",
                email: "rahul@apple.com",
                phoneNumber: "9876543210"
            ),
            Contact(
                name: "Ananya Singh",
                jobTitle: "UI Designer",
                email: "ananya@design.com",
                phoneNumber: "9123456789"
            ),
            Contact(
                name: "Amit Verma",
                jobTitle: "Backend Engineer",
                email: "amit@server.com",
                phoneNumber: "9001122334"
            )
        ]
    var body: some View {
        NavigationStack{
            List(contacts) { contact in
                NavigationLink{
                    ContactDetails(contact:contact)
                }label:{
                    VStack(alignment: .leading){
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.jobTitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}
struct ContactDetails: View {
    let contact: Contact
    var body:some View {
        VStack(spacing: 20) {

                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.blue)

                    Text(contact.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text(contact.jobTitle)
                        .font(.title3)
                        .foregroundColor(.gray)

                    Divider()

                    Text(contact.email)
                        .font(.title2)

                    Text(contact.phoneNumber)
                        .font(.title2)

                    Spacer()
                }
                .padding()
                .navigationTitle("Contact")
                .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview{
    ContactList()
}
