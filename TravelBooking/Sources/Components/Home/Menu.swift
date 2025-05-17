import SwiftUI

struct Menu: View {
  var bgColor: Color
  var icon: String
  var label: String
  var rotationDegrees: Double?

  @Environment(\.colorScheme) private var colorScheme

  private var shadowColor: Color {
    bgColor.opacity(colorScheme == .dark ? 0.75 : 0.25)
  }

  var body: some View {
    VStack(spacing: 10) {
      RoundedRectangle(cornerRadius: 20)
        .fill(bgColor)
        .frame(width: 65, height: 65)
        .shadow(color: shadowColor, radius: 10, y: 10)
        .overlay {
          Image(systemName: icon)
            .resizable()
            .scaledToFit()
            .scaleEffect(0.4)
            .foregroundStyle(.white)
            .rotationEffect(Angle(degrees: Double(rotationDegrees ?? 0)))
        }

      Text(label)
        .font(.subheadline)
    }
  }
}
