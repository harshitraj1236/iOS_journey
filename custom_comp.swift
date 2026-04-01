import SwiftUI
struct LogIn: View {
    let actualPassword: String = "swift123"
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var ismatch: Bool? = nil
    @State private var isUsernameEmpty: Bool? = nil
    @State private var isSecure: Bool? = nil
    var body: some View {
        VStack(spacing:10){
            StyleInput(title: "Username", text: $username, isSecure: false)
            StyleInput(title: "Password", text: $password, isSecure: true)
            Button {
                isUsernameEmpty=username.isEmpty
                ismatch=(password==actualPassword)
            } label: {
                LoginBtn()
            }
            user()
        }
    }
    @ViewBuilder//To return multiple views     To use conditional logic     To improve code organization and readability   To create reusable UI components    To avoid using AnyView
    func result()-> some View {
        if let ismatch{
            if ismatch{
                Text("Success! ✅")
                    .font(.system(size: 30))
                    .foregroundColor(.green)
            }
            else{
                Text("Wrong Password ❌")
                    .font(.system(size: 30))
                    .foregroundColor(.red)
            }
        }
    }
    @ViewBuilder
    func user()-> some View {
        if let isUsernameEmpty{
            if isUsernameEmpty{
                Text("Enter Username")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
            }
            else{
                result()
            }
        }
    }
}
struct LoginBtn: View {
    var body: some View{
        Text("Log In")
            .font(.system(size: 19, weight: .semibold, design: .rounded))
            .frame(width: 70, height: 30)
            .background(Color.teal)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
struct StyleInput: View {
    let title: String
    @Binding var text: String
    let isSecure: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.teal.opacity(0.4), lineWidth: 1)
                )
            field()
                .padding(.horizontal, 12)
                .foregroundColor(.black)
                .accentColor(.teal)
                .autocorrectionDisabled()
                .autocapitalization(.none)
        }
        .frame(height: 48)
    }
    @ViewBuilder
    private func field() -> some View {
        if isSecure {
            SecureField(title, text: $text)
        } else {
            TextField(title, text: $text)
        }
    }
}
#Preview {
    LogIn()
}
