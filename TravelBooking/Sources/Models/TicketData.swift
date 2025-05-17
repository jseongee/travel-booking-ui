import Foundation

struct TicketData: Identifiable {
  let price: Int
  let departureTime1: String
  let departureCode1: String
  let arrivalTime1: String
  let arrivalCode1: String
  let duration1: String
  let departureTime2: String
  let departureCode2: String
  let arrivalTime2: String
  let arrivalCode2: String
  let duration2: String

  let id = UUID()
}
