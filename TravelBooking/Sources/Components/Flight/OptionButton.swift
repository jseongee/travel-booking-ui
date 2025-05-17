import SwiftUI

struct OptionButton: View {
  var isLarge = false
  var isOnlyIcon = false
  var icon: String
  var title: String?
  var value: String?
  var onClick: (() -> Void)?

  @Environment(\.colorScheme) private var colorScheme

  private let iconColor = Color(red: 189/255, green: 194/255, blue: 216/255)

  var body: some View {
    Button {
      (onClick ?? {})()
    } label: {
      RoundedRectangle(cornerRadius: 15)
        .fill(AppColor.secondary(colorScheme))
        .stroke(AppColor.stroke(colorScheme), lineWidth: 2)
        .shadow(color: .blue.opacity(0.15), radius: 10, x: 0, y: 10)
        .overlay(alignment: .leading) {
          HStack(spacing: isLarge ? 30 : 20) {
            Image(systemName: icon)
              .resizable()
              .scaledToFit()
              .frame(width: 20)
              .foregroundStyle(iconColor)
              .rotationEffect(.degrees(title == "From" ? 90 : 0))

            if !isOnlyIcon {
              VStack(alignment: .leading, spacing: 0) {
                Text(title ?? "")
                  .foregroundStyle(.gray)

                HStack {
                  Text(value ?? "")
                    .foregroundStyle(.primary)

                  if title == "Class" {
                    Image(systemName: "chevron.down")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 10)
                      .foregroundStyle(iconColor)
                  }
                }
              }
            }
          }
          .padding(.leading, isLarge ? 30 : 20)
        }
    }
    .buttonStyle(.plain)
    .frame(height: isLarge ? 70 : 60)
    .frame(minWidth: 60)
  }
}
