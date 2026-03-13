//
//  sheet.swift
//  trainning
//
//  Created by Harshit Raj on 23/01/26.
//
import SwiftUI
struct Sheet: View {
    @State private var showEditProfile: Bool = false
    @State private var name: String = "Harshit Raj"
    @State private var Bio: String = "I am Good!"
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue)
                Button {
                    showEditProfile.toggle()
                } label: {
                    Text("Edit Profile")
                        .fontWidth(.condensed)
                        .foregroundColor(.black)
                        .fontDesign(.serif)
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showEditProfile){
                    EditSheet(name: $name, Bio: $Bio)
                }
                Text("Name: \(name)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text(Bio)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
    }
}
struct EditSheet:View {
    @Binding var name: String
    @Binding var Bio: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:20){
            TextField("Edit Name",text: $name)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.white.opacity(0.08))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.blue.opacity(0.6), lineWidth: 1)
                    )
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.words)
            TextField("Add Bio",text: $Bio)
                .padding(.horizontal, 14)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.white.opacity(0.08))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.blue.opacity(0.6), lineWidth: 1)
                    )
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.words)
            Button {
                dismiss()
            } label: {
                Text("Done")
            }
        }
        .padding()
    }
}
#Preview {
    Sheet()
}
