import SwiftUI

struct FlightView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.colorScheme) private var colorScheme

  @StateObject private var vm = FlightViewModel()

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 20) {
        // MARK: - Flight Type Buttons
        HStack(spacing: 20) {
          ForEach(FlightType.allCases) { type in
            FlightTypeButton(
              isSelected: vm.selectedFlightType == type,
              label: type.rawValue,
              icon: "arrow.right.circle.fill"
            ) {
              vm.selectedFlightType = type
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
              value: formattedDate(vm.departures)
            ) {
              vm.showDepartureSheet = true
            }
            .sheet(isPresented: $vm.showDepartureSheet) {
              DeparturesSheet(departures: $vm.departures) {
                vm.showDepartureSheet = false
              }
            }

            Color.clear
          }

          HStack(spacing: 25) {
            OptionButton(
              icon: "person.fill",
              title: "Passengers",
              value: "\(vm.passengers) Adult\(vm.passengers > 1 ? "s" : "")"
            ) {
              vm.showPassengersSheet = true
            }
            .sheet(isPresented: $vm.showPassengersSheet) {
              PassengersSheet(passengers: $vm.passengers) {
                vm.showPassengersSheet = false
              }
            }

            OptionButton(
              icon: "chair.lounge.fill",
              title: "Class",
              value: vm.flightClass.rawValue
            ) {
              vm.showFlightClassSheet = true
            }
            .sheet(isPresented: $vm.showFlightClassSheet) {
              FlightClassSheet(flightClass: $vm.flightClass) {
                vm.showFlightClassSheet = false
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
              ForEach(vm.recommendedOptionColors, id: \.self) { color in
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
