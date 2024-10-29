import SwiftUI

struct ContentView: View {
    @State private var bodyValue: String = ""
    @State private var preferredWeight: Double = 0.0

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer(minLength: 100)

                HStack {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.cyan)
                        .frame(width: 75, height: 75)
                        .padding()
                    Spacer()
                }

                Text("Hydrate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .opacity(0.7)
                    .padding(.top, 5)

                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 50)

                    HStack {
                        Text("Body Weight:")
                            .foregroundColor(.black)

                        TextField("Value", text: $bodyValue)
                            .keyboardType(.decimalPad) 
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing)
                            .onChange(of: bodyValue) { newValue in
                                if let weight = Double(newValue) {
                                    preferredWeight = weight * 0.03
                                }
                            }

                        ZStack {
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 25, height: 25)

                            Button(action: {
                                bodyValue = ""
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)

                Spacer()

                NavigationLink(destination: HydraP2(preferredWeight: preferredWeight)) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
