import Foundation

enum FlightType: String, CaseIterable, Identifiable {
  case oneWay = "One Way"
  case roundTrip = "Round Trip"

  var id: String { self.rawValue }
}

enum FlightClass: String, CaseIterable, Identifiable {
  case business = "Business"
  case first = "First"
  case economy = "Economy"

  var id: String { self.rawValue }
}
