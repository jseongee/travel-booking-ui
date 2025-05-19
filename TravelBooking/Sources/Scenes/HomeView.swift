import SwiftUI

struct HomeView: View {
  @Environment(\.colorScheme) private var colorScheme
  
	@StateObject private var vm = HomeViewModel()

  var body: some View {
    NavigationStack {
      VStack(spacing: 30) {
        Spacer()

        // MARK: - Title & Profile Icon
        HStack {
          VStack(alignment: .leading) {
            Text("Hi, Robert")
              .foregroundStyle(.secondary)

            Text("Find Deals")
              .font(.largeTitle)
              .bold()
          }

          Spacer()

          ProfileIcon()
        }

        // MARK: - Search Bar
        HStack {
          Image(systemName: "magnifyingglass")
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.secondary)
            .padding(.horizontal, 5)

          TextField("Search Flightm Hotels, etc...", text: $vm.searchString)
            .font(.subheadline)
            .bold()
        }
        .padding()
        .background(
          AppColor.secondary(colorScheme),
          in: RoundedRectangle(cornerRadius: 25)
        )

        // MARK: - Menus
        HStack(spacing: 10) {
          NavigationLink(destination: FlightView()) {
            Menu(
              bgColor: AppColor.primary(colorScheme),
              icon: "airplane",
              label: "Flight",
              rotationDegrees: -45
            )
          }
          .buttonStyle(.plain)

          Spacer()

          Menu(
            bgColor: Color(red: 1, green: 113/255, blue: 63/255),
            icon: "building.fill",
            label: "Hotels"
          )

          Spacer()

          Menu(
            bgColor: Color(red: 1, green: 171/255, blue: 47/255),
            icon: "car.fill",
            label: "Taxi"
          )

          Spacer()

          Menu(
            bgColor: Color(red: 0, green: 168/255, blue: 251/255),
            icon: "ellipsis",
            label: "More"
          )
        }

        Spacer()

        // MARK: - Popular Places
        VStack(spacing: 15) {
          HStack {
            Text("Popular places")
              .font(.headline)
              .fontWeight(.bold)

            Spacer()

            Text("View All")
              .font(.subheadline)
              .foregroundStyle(.secondary)
          }

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
              ForEach(samplePlaces) { place in
                PopularPlaceCard(data: place)
              }
            }
            .padding(.horizontal, 20)
            .padding(.top, 5) // 슬라이드 상단테두리 짤림 방지
          }
          .padding(.horizontal, -20)
        }
      }
      .padding(.horizontal, 20)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Image(systemName: "line.3.horizontal")
            .bold()
        }
      }
    }
  }
}

#Preview {
  HomeView()
}
