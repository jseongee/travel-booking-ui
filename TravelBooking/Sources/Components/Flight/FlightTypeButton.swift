import SwiftUI

struct FlightTypeButton: View {
  var isClickable = true
  var isSelected: Bool
  var label: String
  var icon: String
  var onClick: (() -> Void)?

  @Environment(\.colorScheme) private var colorScheme

  private var unselectedButtonColor: Color {
    colorScheme == .dark
      ? Color(red: 45/255, green: 45/255, blue: 55/255)
      : Color(red: 244/255, green: 246/255, blue: 253/255)
  }
  private var unselectedIconBgColor: Color {
    colorScheme == .dark
      ? Color(red: 60/255, green: 60/255, blue: 70/255)
      : Color(red: 233/255, green: 236/255, blue: 245/255)
  }
  private var unselectedFontColor: Color {
    colorScheme == .dark
      ? Color(red: 180/255, green: 190/255, blue: 220/255)
      : Color(red: 134/255, green: 141/255, blue: 175/255)
  }

  var body: some View {
    Button {
      (onClick ?? {})()
    } label: {
      Label {
        Text(label)
          .font(.subheadline)
          .foregroundStyle(
            isSelected ? AppColor.primary(colorScheme) : unselectedFontColor
          )
          .padding(.vertical, 3)
      } icon: {
        Image(systemName: icon)
          .resizable()
          .frame(width: 20, height: 20)
          .symbolRenderingMode(.palette)
          .foregroundStyle(
            isSelected ? .white : unselectedFontColor,
            isSelected ? AppColor.primary(colorScheme) : unselectedIconBgColor
          )
      }
    }
    .buttonStyle(.borderedProminent)
    .buttonBorderShape(.capsule)
    .tint(isSelected ? AppColor.secondary(colorScheme) : unselectedButtonColor)
    .allowsHitTesting(isClickable)
  }
}
