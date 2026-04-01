import SwiftUI

struct PayAnimation:View {
    @State private var tapped: Bool = false
    var body: some View {
        ZStack{
            Color.primary.opacity(0.88).ignoresSafeArea()
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: tapped ? 200 : 20)
                        .fill( tapped ? Color.green : Color.blue)
                        .frame(width: tapped ? 70 : 300, height: tapped ? 70 : 200)
                        .shadow(radius: 10, y: 5)
                    
                    Text("Confirm Payment")
                        .font(.system(size: 26,weight: .semibold,design: .serif))
                        .foregroundColor(.white)
                        .opacity(tapped ? 0 : 1)
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35,height: 35)
                        .opacity(tapped ? 1 : 0)
                        .foregroundColor(.white)
                        
                }
                Button{
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)){
                        tapped.toggle()
                    }
                } label: {
                    Text(tapped ? "Go Back" : "Pay Now")
                        .font(.system(size: 15,weight: .medium,design:.rounded))
                        .foregroundColor(.white)
                        .frame(width:75,height: 30)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.gray.opacity(0.2))
                .padding(.top, tapped ? 180 : 40)
            }
        }
    }
}

#Preview {
    PayAnimation()
}
