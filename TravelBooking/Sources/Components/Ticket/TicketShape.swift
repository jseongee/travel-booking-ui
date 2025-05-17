import SwiftUI

struct TicketShape: Shape {
  func path(in rect: CGRect) -> Path {
    let radius: CGFloat = 15
    let left = Circle()
      .path(
        in: CGRect(
          x: -radius,
          y: 65,
          width: radius * 2,
          height: radius * 2
        )
      )
    let right = Circle()
      .path(
        in: CGRect(
          x: rect.maxX - radius,
          y: 65,
          width: radius * 2,
          height: radius * 2
        )
      )

    return RoundedRectangle(cornerRadius: 25)
      .path(in: rect)
      .subtracting(left)
      .subtracting(right)
  }
}
