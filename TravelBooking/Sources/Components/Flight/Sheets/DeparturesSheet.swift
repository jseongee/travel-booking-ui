import SwiftUI

struct DeparturesSheet: View {
  @Binding var departures: Date
  var onClose: () -> Void

  var body: some View {
    VStack {
      DatePicker("", selection: $departures, displayedComponents: .date)
        .datePickerStyle(.graphical)
        .padding()

      Button("Close") { onClose() }
        .buttonStyle(.borderedProminent)
    }
    .presentationDetents([.height(500)])
  }
}
