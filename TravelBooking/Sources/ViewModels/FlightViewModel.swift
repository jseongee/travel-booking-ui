import SwiftUI

class FlightViewModel: ObservableObject {
    @Published var selectedFlightType: FlightType = .oneWay
    @Published var departures: Date = Date()
    @Published var passengers: Int = 1
    @Published var flightClass: FlightClass = .business

    @Published var showDepartureSheet: Bool = false
    @Published var showPassengerSheet: Bool = false
    @Published var showFlightClassSheet: Bool = false

    let recommendedOptionColors: [Color] = [
        Color(red: 1/255, green: 205/255, blue: 1),
        Color(red: 102/255, green: 150/255, blue: 1),
        Color(red: 1, green: 172/255, blue: 136/255),
        Color(red: 255/255, green: 140/255, blue: 0),
        Color(red: 153/255, green: 50/255, blue: 204/255)
    ]
}
