import Foundation

struct PlaceData: Identifiable {
  let image: String
  let title: String
  let distance: Double

  let id = UUID()
}
