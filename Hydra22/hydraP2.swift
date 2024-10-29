import SwiftUI

struct HydraP2: View {
    @State private var SelecINT: Int? = nil
    @State private var StartTime: String = "00:00"
    @State private var EndTime: String = "00:00"
    @State private var StartH: String = "AM"
    @State private var EndH: String = "AM"
    var preferredWeight: Double

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Notification Preferences")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()
            }
            .padding(.top, 10)

            Text("The start and end hour")
                .font(.body)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.top, 5)
            Text("Specify the start and end hour to receive notifications")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 5)

            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 125)
                    .padding(.top, 10)

                VStack {
                    HStack {
                        Text("Start Time")
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                        HStack {
                            TextField("HH:MM", text: $StartTime)
                                .frame(width: 80)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)

                            Picker("AM/PM", selection: $StartH) {
                                Text("AM").tag("AM")
                                Text("PM").tag("PM")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: 80)
                        }
                    }

                    Divider()

                    HStack {
                        Text("End Time")
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                        HStack {
                            TextField("HH:MM", text: $EndTime)
                                .frame(width: 80)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)

                            Picker("AM/PM", selection: $EndH) {
                                Text("AM").tag("AM")
                                Text("PM").tag("PM")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: 80)
                        }
                    }
                }
                .padding(.horizontal)
            }

            Text("Notification interval")
                .font(.body)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.top, 5)
            Text("How often would you like to receive notifications within the specified time interval")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 5)

            let topB = ["15 ", "30 ", "60 ", "90 "]
            let bottomB = ["2 ", "3 ", "4 ", "5 "]

            // Top row
            HStack(spacing: 15) {
                Spacer()
                ForEach(0..<topB.count, id: \.self) { index in
                    Button(action: {
                        SelecINT = index + 1
                        print("Selected interval: \(topB[index])")
                    }) {
                        VStack {
                            Text(topB[index])
                                .font(.headline)
                                .foregroundColor(SelecINT == index + 1 ? .white : .cyan)
                            Text("Min")
                                .font(.body)
                                .foregroundColor(SelecINT == index + 1 ? .white : .black)
                        }
                        .frame(width: 70, height: 70)
                        .background(SelecINT == index + 1 ? Color.cyan : Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                Spacer()
            }
            .padding(.top, 20)

            // Bottom row
            HStack(spacing: 15) {
                Spacer()
                ForEach(0..<bottomB.count, id: \.self) { index in
                    Button(action: {
                        SelecINT = index + 5
                        print("Selected interval: \(bottomB[index])")
                    }) {
                        VStack {
                            Text(bottomB[index])
                                .font(.body)
                                .foregroundColor(SelecINT == index + 5 ? .white : .cyan)
                            Text("Hours")
                                .font(.body)
                                .foregroundColor(SelecINT == index + 5 ? .white : .black)
                        }
                        .frame(width: 70, height: 70)
                        .background(SelecINT == index + 5 ? Color.cyan : Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                Spacer()
            }
            .padding(.top, 10)

            Spacer()

            NavigationLink(destination: HydraP3(preferredWeight: preferredWeight)) {
                Text("Start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HydraP2(preferredWeight: 0.0)
}
