//
//  ContentView.swift
//  insta-page
//
//  Created by Harshit Raj on 09/11/25.
//
//(colors: #56ADFF,color:#33D1FF)]
//
//
import SwiftUI
extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF)/255,
            green: Double((hex >> 8) & 0xFF)/255,
            blue: Double(hex & 0xFF)/255,
            opacity: alpha
        )
    }
}
struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [
                    Color(hex: "#33D1FF")!,
                    Color(hex: "#56ADFF")!
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading){
                    //this section is header section
                    HStack(alignment: .center, spacing: 70) {
                        Text("<")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("harshitraj@1236")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(10)
                        
                        Text("...")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    //this section is dp and posts stuff and all
                    HStack(alignment: .center,spacing:80){
                        Image(systemName: "IMG_0336")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.yellow)
                        VStack(alignment:.center,spacing:20){
                            HStack(spacing:20){
                                statView("120","Posts")
                                statView("12k","Followers")
                                statView("300", "Following")
                            }
                            Button(action:{print("Follow")}){
                                Text("Follow")
                                    .fontWeight(.regular)
                                    .frame(width:200,height:30)
                                    .background(Color.blue)
                                    .foregroundStyle(Color.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    //this is the bio section
                    VStack(alignment:.leading,spacing:0){
                        Text("iOS Developer")
                            .font(.title3)
                            .bold(true)
                            .fontDesign(.serif)
                        Text("Coffee Enthusiast")
                            .font(.title3)
                            .fontWeight(.medium)
                            .fontDesign(.serif)
                        Text("Part-time bug fixer")
                            .font(.title3)
                            .fontWeight(.light)
                            .fontDesign(.serif)
                    }
                    //this is highlight section
                    HStack(alignment: .center,spacing:3){
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width:50,height:50)
                            .frame(width:60,height:60)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(30)
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width:50,height:50)
                            .frame(width:60,height:60)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(30)
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width:50,height:50)
                            .frame(width:60,height:60)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(30)
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width:50,height:50)
                            .frame(width:60,height:60)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(30)
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width:50,height:50)
                            .frame(width:60,height:60)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(30)
                        Circle()
                            .fill(Color.green.opacity(0.4))
                            .frame(width:50,height:50)
                            .frame(width:60,height:60)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(30)
                    }
                    //this is the gallery section
                    VStack(alignment:.leading){
                        Text("Gallery")
                            .padding(CGFloat(10))
                            .font(.title)
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .foregroundStyle(.brown)
                        HStack(alignment:.center,spacing:20){
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                        }
                        HStack(alignment:.center,spacing:20){
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                        }
                        HStack(alignment:.center,spacing:20){
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                        }
                        HStack(alignment:.center,spacing:20){
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                            Rectangle()
                                .fill(Color.gray.opacity(0.8))
                                .frame(width:100,height:100)
                                .cornerRadius(15)
                                .padding(5)
                        }
                    }
                }
            }
        }
    }
}
func statView(_ value: String, _ label: String) -> some View {
    VStack {
        Text(value).font(.headline)
        Text(label).font(.caption)
    }
}

#Preview {
    ContentView()
}
