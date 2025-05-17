import SwiftUI

struct ProfileIcon: View {
  var body: some View {
    Circle()
      .fill(Color(red: 175/255, green: 181/255, blue: 243/255))
      .frame(width: 55, height: 55)
      .overlay {
        Image(systemName: "person.fill")
          .resizable()
          .scaledToFit()
          .foregroundStyle(.white)
          .frame(width: 18)

        Circle()
          .fill(Color(red:0, green: 170/255, blue: 1))
          .stroke(Color.white, lineWidth: 2)
          .frame(width: 8)
          .offset(x: 19, y: -19)
      }
  }
}
