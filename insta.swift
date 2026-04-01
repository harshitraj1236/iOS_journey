import SwiftUI
struct Log: View {
    @State private var UserName: String = ""
    @State private var Password: String = ""
    @State private var isDarkMode: Bool = true
    var body: some View {
        ZStack{
            (isDarkMode ? Color.black.opacity(0.9) : Color.gray.opacity(0.5)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("Entrance")
                        .font(.largeTitle)
                        .foregroundColor(isDarkMode ? .white : .black)
                    Spacer()
                    Button(action:{
                        withAnimation(.spring()){
                            isDarkMode.toggle()
                        }
                    }){
                        Image(systemName: isDarkMode ? "moon.stars.fill" : "sun.max.fill")
                            .font(.title3)
                            .foregroundColor(isDarkMode ? .cyan : .orange)
                            .padding(10)
                            .background(isDarkMode ? Color.gray.opacity(0.4) : Color.black.opacity(0.4))
                            .clipShape(Circle())
                    }
                }
                .padding(.vertical)
                .padding(.horizontal)
                Spacer().frame(height:10)
                VStack(spacing: 10){
                    Text("Welcome!")
                        .font(.system(size: 34,weight: .bold,design: .serif))
                        .foregroundColor(isDarkMode ? .blue : .green)
                }
                ZStack{
                    Circle()
                        .strokeBorder(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3)
                        .frame(width: 120, height: 120)
                        .background(Circle().fill(isDarkMode ? Color.white.opacity(0.05) : Color.gray.opacity(0.1)))
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60,height: 70)
                        .foregroundColor(isDarkMode ? .green : .gray)
                }
                .shadow(color: .blue, radius: 10, x: 4, y:4)
                VStack(spacing: 20){
                    CustomText(
                        icon: "person",
                        placeholder: "Enter username",
                        text: $UserName,
                        isDarkMode: isDarkMode
                    )
                    CustomText(icon: "lock.fill", placeholder: "Password", text: $Password, isDarkMode: isDarkMode)
                }
                .padding()
                HStack{
                    VStack(alignment: .leading){
                        Text("Verification Status")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    Spacer()
                    Button("Log In"){
                        //i want not able to add next page after login , may be after sometime
                    }
                    .font(.caption)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
                }
                .padding()
                .background(isDarkMode ? Color.white.opacity(0.05) : Color.gray.opacity(0.05))
                .cornerRadius(12)
                .padding(.horizontal)
                Spacer()
                Button(action:{
                    print("Logged In")
                }){
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15)
                        .shadow(color: .blue.opacity(0.4), radius: 10, x: 0, y: 10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
    struct customText:View {
        var icon: String
        var placeholder: String
        @Binding var text: String
        var isDarkMode: Bool
        var body: some View {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                TextField(placeholder, text: $text)
                    .foregroundColor(isDarkMode ? .white : .black)
            }
            .padding()
            .background(isDarkMode ? Color(white: 0.15) : Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isDarkMode ? Color.clear : Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
#Preview{
    Log()
}
