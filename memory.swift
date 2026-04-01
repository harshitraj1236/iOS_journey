import SwiftUI
struct Memory: View {
    @State private var showSheet: Bool = false
    @AppStorage("name") private var name: String = "Harshit Raj"
    @AppStorage("bio") private var bio: String = "I am fine!"
    var body: some View {
        ZStack{
            VStack(spacing:15){
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width:30,height:30)
                    .foregroundColor(.blue)
                    .shadow(color: Color.black,radius: 15,x:3,y:0)
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Edit")
                        .padding(.horizontal)
                        .font(.system(size:15,weight:.bold,design: .monospaced))
                }
                .buttonStyle(.glass)
                .sheet(isPresented: $showSheet){
                    edit_Profile(name: $name, bio: $bio)
                }
                VStack{
                    Text(name)
                        .font(.system(size: 35, weight: .bold, design: .serif))
                        .foregroundColor(.mint)
                    Text(bio)
                        .font(.system(size: 20,weight: .medium,design: .rounded))
                        .foregroundStyle(Color.gray)
                }
            }
        }
    }
}
struct edit_Profile: View {
    @Binding var name: String
    @Binding var bio: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:10){
            TextField("Name",text: $name)
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
            TextField("Bio", text: $bio)
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
                Text("Change")
            }
            .buttonStyle(.borderedProminent)
            .border(.fill)
        }
    }
}
#Preview {
    Memory()
}
