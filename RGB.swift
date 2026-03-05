//
//  RGB.swift
//  trainning
//
//  Created by Harshit Raj on 23/12/25.
//
import SwiftUI
struct RGB: View {
    @State private var redvalue:Double = 0.00
    @State private var greenvalue:Double = 0.00
    @State private var bluevalue:Double = 0.00
    var setColor: Color {
        return Color(red:redvalue/255,green:greenvalue/255,blue:bluevalue/255)
    }
    var screenBackground: Color {
            if redvalue < 20 && greenvalue < 20 && bluevalue < 20 {
                return .white
            }
            if redvalue > 235 && greenvalue > 235 && bluevalue > 235 {
                return .black
            }
            return .clear
        }
    var body: some View{
        VStack(spacing:20){
            Circle()
                .fill(setColor)
                .frame(width:240 , alignment: .center)
            VStack(spacing:20){
                
                HStack(spacing:10){
                    Text("Red")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 25,weight: .semibold,design:.serif))
                    Slider(value: $redvalue, in: 0...255 , step: 1)
                        .padding(.horizontal)
                        .accentColor(.red)
                    Text("\(redvalue,specifier: "%.2f")")
                        .font(.system(size: 15,weight: .semibold,design:.serif))
                }
                
                HStack(spacing:10){
                    Text("Green")
                        .foregroundStyle(Color.green)
                        .font(.system(size: 22,weight: .semibold,design: .serif))
                    Slider(value: $greenvalue, in: 0...255,step: 1)
                        .padding(.horizontal)
                        .accentColor(.green)
                    Text("\(greenvalue,specifier: "%.2f")")
                        .font(.system(size: 15,weight: .semibold,design:.serif))
                }
                
                HStack(spacing:10){
                    Text("Blue")
                        .foregroundStyle(Color.blue)
                        .font(.system(size: 25,weight:.semibold,design:.serif))
                    Slider(value: $bluevalue,in: 0...255,step: 1)
                        .padding(.horizontal)
                        .accentColor(.blue)
                    Text("\(bluevalue,specifier: "%0.2f")")
                        .font(.system(size: 15,weight:.semibold,design:.serif))
                }
            }
            .padding()
            Spacer()
            
        }
        .background(screenBackground.ignoresSafeArea())
        .padding()
    }
}
#Preview {
    RGB()
}
