import SwiftUI

struct RecommendedOption: View {
  var bgColor: Color

  var body: some View {
    RoundedRectangle(cornerRadius: 25)
      .fill(bgColor)
      .frame(width: 140, height: 160)
      .shadow(color: bgColor.opacity(0.15), radius: 10, x: 0, y: 10)
      .overlay {
        VStack(alignment: .leading, spacing: 15) {
          RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(width: 40, height: 40)
            .overlay {
              Image(systemName: "airplane")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundStyle(bgColor)
                .rotationEffect(.degrees(-45))
            }

          VStack(alignment: .leading, spacing: 5) {
						Text("17 August 2020")
              .font(.caption)

            HStack(spacing: 10) {
              Text("SFC")
                .font(.headline)

              Image(systemName: "arrow.left.arrow.right")
                .resizable()
                .scaledToFit()
                .frame(width: 8)

              Text("NYC")
                .font(.headline)
            }
          }
          .foregroundStyle(.white)

          Text("$2,453")
            .font(.headline)
            .foregroundStyle(.white)
        }
      }
  }
}
