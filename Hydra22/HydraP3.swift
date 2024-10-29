import SwiftUI

struct HydraP3: View {
    @State private var waterIndex: Int = 0
    @State private var totalWaterIntake: Double = 0.0
    var preferredWeight: Double

    var waterThresholds: [Double] {
        let threshold = preferredWeight / 4
        return [0.0, threshold, threshold * 2, threshold * 3, preferredWeight]
    }

    let images: [String] = ["zzzz", "turtle", "haree", "clap"]

    var body: some View {
        VStack {
            HStack {
                Text("Today's Water Intake")
                    .font(.body)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            // Display the current total water intake
            HStack {
                Text("\(totalWaterIntake, specifier: "%.1f")")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(totalWaterIntake >= preferredWeight ? .green : .black)
                    .padding(.top, 5)
                // Show the user's preferred water intake goal 
                Text("/ \(preferredWeight, specifier: "%.1f") L")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            Spacer()
            Spacer()
            Spacer()

            ZStack {
                Circle()
                    .stroke(lineWidth: 30)
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(width: 300, height: 300)

                Circle()
                    .trim(from: 0.0, to: CGFloat(totalWaterIntake / preferredWeight))
                    .stroke(Color.cyan, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 300, height: 300)

                Image(totalWaterIntake >= preferredWeight ? "clap" : images[min(waterIndex, images.count - 1)])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 30)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.2), value: waterIndex)
            }

            Spacer()
            VStack {
                Text("\(totalWaterIntake, specifier: "%.1f") L")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.black)
                    .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 120, height: 40)
                    HStack {
                        Button(action: {
                            withAnimation {
                                if totalWaterIntake >= 0.3 {
                                    totalWaterIntake -= 0.3
                                    updateWaterIndex()
                                }
                            }
                        }) {
                            Text("-")
                                .font(.title)
                                .foregroundColor(totalWaterIntake > 0.0 ? .black : .gray)
                                .frame(width: 40, height: 40)
                        }
                        .disabled(totalWaterIntake <= 0.0)

                        Divider()
                            .frame(height: 30)
                            .background(Color.black)

                        Button(action: {
                            withAnimation {
                                let newTotalIntake = totalWaterIntake + 0.3
                                if newTotalIntake <= preferredWeight {
                                    totalWaterIntake = newTotalIntake
                                } else {
                                    totalWaterIntake = preferredWeight
                                }
                                updateWaterIndex()
                            }
                        }) {
                            Text("+")
                                .font(.title)
                                .foregroundColor(totalWaterIntake < preferredWeight ? .black : .gray)
                                .frame(width: 40, height: 40)
                        }
                        .disabled(totalWaterIntake >= preferredWeight)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
            }
            .padding()

            Spacer()
        }
        .padding()
    }

    private func updateWaterIndex() {
        for (index, threshold) in waterThresholds.enumerated() {
            if totalWaterIntake >= threshold {
                waterIndex = index
            }
        }

        if totalWaterIntake >= preferredWeight {
            waterIndex = waterThresholds.count - 1
        }
    }
}

#Preview {
    HydraP3(preferredWeight: 2.7)
}
