import SwiftUI

struct DepartureAndArrival: View {
  var departureTime: String
  var departureCode: String
  var arrivalTime: String
  var arrivalCode: String
  var duration: String

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(departureTime)
          .font(.footnote)
          .fontWeight(.semibold)

        Text(departureCode)
          .font(.caption)
          .foregroundColor(.gray)
      }

      Spacer()

      HStack(spacing: 5) {
        Image(systemName: "airplane")

        ForEach(1..<9) { _ in
          Circle()
            .frame(width: 2, height: 2)
        }

				Circle()
          .frame(width: 6, height: 6)

        ForEach(1..<9) { _ in
          Circle()
            .frame(width: 2, height: 2)
        }

        Image(systemName: "mappin.and.ellipse")
      }
      .font(.caption)
      .foregroundColor(.secondary)
      .overlay {
        Text(duration)
          .offset(y: -12)
          .font(.caption)
          .foregroundColor(.secondary)
      }

      Spacer()

      VStack(alignment: .trailing) {
        Text(arrivalTime)
          .font(.footnote)
          .fontWeight(.semibold)

        Text(arrivalCode)
          .font(.caption)
          .foregroundColor(.gray)
      }
    }
  }
}
