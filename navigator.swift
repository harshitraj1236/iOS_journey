//
//  navigator.swift
//  trainning
//
//  Created by Harshit Raj on 07/01/26.
//
import SwiftUI
struct HomeView: View {
    @State private var selectView: Int = 0
    var body: some View {
        TabView(selection: $selectView){
            NavigationStack{
                MainAppView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(1)
            SettingView()
                .tabItem {
                    Label("Setting",systemImage: "gearshape")
                }
                .tag(2)
        }
    }
}
struct MainAppView: View {
    var body: some View {
            Image(systemName: "house.fill")
                .foregroundStyle(.orange)
                .font(.system(size: 150))
            Text("Home Screen")
                .font(.largeTitle)
    }
}
struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Image(systemName: "person.fill")
                    .foregroundStyle(.cyan)
                    .font(.system(size: 150))
                Text("My Profile")
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(Color.green)
                NavigationLink(destination: SettingView()){
                    HStack{
                        Image(systemName: "gearshape.fill")
                        Text("Go To Setting")
                    }
                }
            }
            .padding()
        }
    }
}
struct SettingView: View {
    var body: some View {
            VStack(spacing:20){
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(.gray)
                    .font(.system(size: 120))
                Text("App Setting")
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(Color.blue)
            .padding()
        }
    }
}
#Preview {
    HomeView()
}
