import SwiftUI

struct PassengersSheet: View {
  @Binding var passengers: Int
  var onClose: () -> Void

  var body: some View {
    VStack(spacing: 20) {
      Stepper("Passengers", value: $passengers, in: 1...9)

      Button("Close") { onClose() }
        .buttonStyle(.borderedProminent)
    }
    .padding()
    .presentationDetents([.height(200)])
  }
}
