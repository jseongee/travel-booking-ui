import SwiftUI

struct FlightClassSheet: View {
  @Binding var flightClass: FlightClass
  var onClose: () -> Void

  var body: some View {
    VStack (spacing: 20) {
      List {
        ForEach(FlightClass.allCases) { item in
          HStack {
            Text(item.rawValue)

            Spacer()

            if item == flightClass {
              Image(systemName: "checkmark")
                .foregroundColor(.blue)
            }
          }
          .contentShape(Rectangle())
          .onTapGesture { flightClass = item }
        }
      }

      Button("Close") { onClose() }
        .buttonStyle(.borderedProminent)
    }
    .presentationDetents([.height(250)])
  }
}
