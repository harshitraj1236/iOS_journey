import SwiftUI

struct Smart_Counter: View {
    @State private var count: Int = 0
    var set: Color{
        if count == 0 {
            return .gray
        }
        else if count == 10 {
            return .red
        }
        else {
            return .primary
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(count)")
                .font(.system(size: 100,weight: .semibold,design: .serif))
                .foregroundStyle(set)
            Spacer()
            HStack {
                Button {
                    count += 1
                }label: {
                    Text("Up")
                        .font(.system(size: 20,weight: .heavy,design:  .monospaced))
                        .frame(width: 60, height: 60)
                }
                .buttonStyle(.borderedProminent)
                .disabled(count == 10)
                
                Button {
                    count -= 1
                }label: {
                    Text("Down")
                        .font(.system(size: 20,weight: .heavy,design:  .monospaced))
                        .frame(width: 60, height: 60)
                }
                .disabled(count == 0)
                .buttonStyle(.bordered)
                if count != 0 {
                    Button {
                        count = 0
                    }label: {
                        Text("Reset")
                            .font(.system(size: 18,weight: .heavy,design:  .monospaced))
                            .frame(width: 60, height: 60)
                    }
                    .tint(.red)
                }
            }
            .controlSize(.large)
            Spacer()
        }
        .padding()
    }
}
#Preview {
    Smart_Counter()
}
