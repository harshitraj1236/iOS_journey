import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let jobTitle: String
    let email: String
    let phoneNumber: String
    let color: Color
}

struct ContactList: View {
    let contacts: [Contact] = [
        Contact(name: "Rahul Sharma", jobTitle: "iOS Developer", email: "rahul@apple.com", phoneNumber: "9876543210", color: .blue),
        Contact(name: "Ananya Singh", jobTitle: "UI Designer", email: "ananya@design.com", phoneNumber: "9123456789", color: .purple),
        Contact(name: "Amit Verma", jobTitle: "Backend Engineer", email: "amit@server.com", phoneNumber: "9001122334", color: .orange)
    ]
    
    var body: some View {
        NavigationStack {
            List(contacts) { contact in
                NavigationLink(destination: ContactDetails(contact: contact)) {
                    ContactRow(contact: contact)
                }
            }
            .navigationTitle("Contacts")
            .listStyle(.plain)
        }
    }
}

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack(spacing: 15) {
            Text(String(contact.name.prefix(1)))
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .background(contact.color.gradient)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(contact.name)
                    .font(.body)
                    .fontWeight(.semibold)
                Text(contact.jobTitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

struct ContactDetails: View {
    let contact: Contact
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                VStack(spacing: 15) {
                    Circle()
                        .fill(contact.color.gradient)
                        .frame(width: 120, height: 120)
                        .overlay(
                            Text(String(contact.name.prefix(1)))
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .shadow(color: contact.color.opacity(0.3), radius: 10, x: 0, y: 10)
                    
                    VStack(spacing: 4) {
                        Text(contact.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(contact.jobTitle)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)
                
                HStack(spacing: 30) {
                    ActionButton(icon: "phone.fill", label: "Call", color: .green)
                    ActionButton(icon: "envelope.fill", label: "Email", color: .blue)
                    ActionButton(icon: "message.fill", label: "Message", color: .orange)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    ContactData(icon: "envelope", label: "Email", value: contact.email)
                    Divider()
                    ContactData(icon: "phone", label: "Phone", value: contact.phoneNumber)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ActionButton: View {
    let icon: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(color.gradient)
                .clipShape(Circle())
            
            Text(label)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(color)
        }
    }
}

struct ContactData: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 25)
            
            VStack(alignment: .leading) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
                Text(value)
                    .font(.body)
            }
        }
    }
}

#Preview {
    ContactList()
}
