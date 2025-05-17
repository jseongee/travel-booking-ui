import SwiftUI

struct PopularPlaceCard: View {
  var data: PlaceData

  @Environment(\.colorScheme) private var colorScheme

  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .stroke(AppColor.stroke(colorScheme), lineWidth: 2)
      .fill(AppColor.secondary(colorScheme))
      .frame(width: 250, height: 330)
      .shadow(color: Color.blue.opacity(0.15), radius: 10, x: 0, y: 10)
      .overlay {
        VStack(alignment: .leading) {
          Image(data.image)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 220, maxHeight: 220)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
              Image(systemName: "bookmark.circle.fill")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .offset(x: -30, y: 30)
                .scaleEffect(1.25)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .white.opacity(0.5))
            }

          Spacer()

          VStack(alignment: .leading, spacing: 5) {
            Text(data.title)
              .font(.headline)
              .foregroundStyle(.primary)

            Text("Distance to \(String(format: "%.3f", data.distance)) mi")
              .font(.caption2)
              .foregroundStyle(.secondary)
          }

          Spacer()
        }
        .padding(15)
      }
  }
}
