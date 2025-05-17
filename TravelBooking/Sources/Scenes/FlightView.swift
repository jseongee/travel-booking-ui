import SwiftUI

enum FlightType: String, CaseIterable, Identifiable {
  case oneWay = "One Way"
  case roundTrip = "Round Trip"

  var id: String { self.rawValue }
}

enum FlightClass: String, CaseIterable, Identifiable {
  case business = "Business"
  case first = "First"
  case economy = "Economy"

  var id: String { self.rawValue }
}

struct FlightView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.colorScheme) private var colorScheme

  private let recommendedOptionColors: [Color] = [
      Color(red: 1/255, green: 205/255, blue: 1),
      Color(red: 102/255, green: 150/255, blue: 1),
      Color(red: 1, green: 172/255, blue: 136/255),
      Color(red: 255/255, green: 140/255, blue: 0),
      Color(red: 153/255, green: 50/255, blue: 204/255)
  ]

  @State private var selectedFlightType: FlightType = .oneWay
  @State private var departures = Date()
  @State private var passengers = 1
  @State private var flightClass: FlightClass = .business

  @State private var showDeparturesSheet = false
  @State private var showPassengersSheet = false
  @State private var showFlightClassSheet = false

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 20) {
        // MARK: - Flight Type Buttons
        HStack(spacing: 20) {
          ForEach(FlightType.allCases) { type in
            FlightTypeButton(
              isSelected: selectedFlightType == type,
              label: type.rawValue,
              icon: "arrow.right.circle.fill"
            ) {
              selectedFlightType = type
            }
          }
        }

        // MARK: - Searching Options
        VStack(spacing: 15) {
          ZStack {
            VStack(spacing: 15) {
              OptionButton(
                isLarge: true,
                icon: "airplane",
                title: "From",
                value: "San Francisco"
              )

              OptionButton(
                isLarge: true,
                icon: "mappin.and.ellipse",
                title: "Destination",
                value: "New York"
              )
            }

            HStack {
              Spacer()

              Button {

              } label: {
                RoundedRectangle(cornerRadius: 17)
                  .foregroundStyle(AppColor.primary(colorScheme))
                  .frame(width: 65, height: 65)
                  .overlay {
                    Image(systemName: "arrow.left.arrow.right")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 25)
                      .rotationEffect(.degrees(90))
                      .bold()
                      .foregroundStyle(.white)
                  }
                  .shadow(color: AppColor.primary(colorScheme).opacity(0.15), radius: 10, x: 0, y: 10)
              }
              .padding(.trailing, 20)
            }
          }

          HStack(spacing: 25) {
            OptionButton(
              icon: "calendar",
              title: "Departures",
              value: formattedDate(departures)
            ) {
              showDeparturesSheet = true
            }
            .sheet(isPresented: $showDeparturesSheet) {
              DeparturesSheet(departures: $departures) {
                showDeparturesSheet = false
              }
            }

            Color.clear
          }

          HStack(spacing: 25) {
            OptionButton(
              icon: "person.fill",
              title: "Passengers",
              value: "\(passengers) Adult\(passengers > 1 ? "s" : "")"
            ) {
              showPassengersSheet = true
            }
            .sheet(isPresented: $showPassengersSheet) {
              PassengersSheet(passengers: $passengers) {
                showPassengersSheet = false
              }
            }

            OptionButton(
              icon: "chair.lounge.fill",
              title: "Class",
              value: flightClass.rawValue
            ) {
              showFlightClassSheet = true
            }
            .sheet(isPresented: $showFlightClassSheet) {
              FlightClassSheet(flightClass: $flightClass) {
                showFlightClassSheet = false
              }
            }
          }

          HStack(spacing: 20) {
            OptionButton(
              isOnlyIcon: true,
              icon: "percent",
            )

            Button {

            } label: {
              Text("Search The Flight")
                .bold()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(AppColor.primary(colorScheme))
            .shadow(color: AppColor.primary(colorScheme).opacity(0.15), radius: 10, x: 0, y: 10)
            .layoutPriority(1)

            Color.clear
              .frame(minWidth: 60)
          }
        }

        // MARK: - Recommeneded Options
        VStack(spacing: 15) {
          HStack {
            Text("Recommended")
              .font(.headline)
              .fontWeight(.bold)

            Spacer()

            Text("View All")
              .font(.subheadline)
              .foregroundStyle(.secondary)
          }
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
              ForEach(recommendedOptionColors, id: \.self) { color in
                NavigationLink(destination: CheckoutView()) {
                  RecommendedOption(bgColor: color)
                }
              }
            }
            .padding(.horizontal, 20)
          }
          .padding(.horizontal, -20)
        }
      }
      .padding(.horizontal, 20)
      .navigationBarBackButtonHidden()
      .navigationBarTitleDisplayMode(.large)
      .navigationTitle("Book Your Flight")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .bold()
              .tint(.primary)
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          Image(systemName: "line.3.horizontal")
            .bold()
        }
      }
    }
  }
}

#Preview {
  FlightView()
}

extension FlightView {
  private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()

    formatter.dateFormat = "d MMMM yyyy"

    return formatter.string(from: date)
  }
}
