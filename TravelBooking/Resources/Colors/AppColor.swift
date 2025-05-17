import SwiftUI

enum AppColor {
  static func primary(_ scheme: ColorScheme) -> Color {
    scheme == .dark
    ? Color(red: 130/255, green: 150/255, blue: 255/255)
    : Color(red: 91/255, green: 102/255, blue: 243/255)
  }

  static func secondary(_ scheme: ColorScheme) -> Color {
    scheme == .dark
    ? Color(red: 30/255, green: 30/255, blue: 40/255)
    : Color(red: 245/255, green: 245/255, blue: 1)
  }

  static func stroke(_ scheme: ColorScheme) -> Color {
    scheme == .dark
    ? Color.white.opacity(0.1)
    : Color(red: 234/255, green: 237/255, blue: 246/255)
  }
}
