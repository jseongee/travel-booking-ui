import SwiftUI

struct Ticket: View {
  var data: TicketData

  @Environment(\.colorScheme) private var colorScheme

  var body: some View {
    TicketShape()
      .stroke(AppColor.stroke(colorScheme), lineWidth: 2)
      .fill(AppColor.secondary(colorScheme))
      .shadow(color: Color.blue.opacity(0.15), radius: 10, x: 0, y: 10)
      .overlay {
        VStack {
          HStack {
            Circle()
              .fill(Color(red: 132/255, green: 142/255, blue: 178/255))
              .frame(width: 40, height: 40)
              .overlay {
                Image(systemName: "airplane")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 15)
                  .foregroundColor(.white)
                  .rotationEffect(.degrees(-45))
              }

            Text("Airways")
              .font(.title3)
              .bold()

            Spacer()

            Text("\(data.price)")
              .font(.title3)
              .bold()
              .overlay(alignment: .topLeading) {
                Text("$")
                  .font(.caption)
                  .offset(x: -10)
              }
          }

          Spacer()

          Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round, dash: [10, 5]))
            .fill(.secondary)
            .frame(height: 1)

          Spacer()

          VStack(spacing: 10) {
            HStack {
              Text("Departure")
                .foregroundStyle(.secondary)
                .font(.footnote)

              Spacer()

              Text("Arrive")
                .foregroundStyle(.secondary)
                .font(.footnote)
            }
            .padding(.top, 10)

            DepartureAndArrival(
              departureTime: data.departureTime1,
              departureCode: data.departureCode1,
              arrivalTime: data.arrivalTime1,
              arrivalCode: data.arrivalCode1,
              duration: data.duration1
            )

            DepartureAndArrival(
              departureTime: data.departureTime2,
              departureCode: data.departureCode2,
              arrivalTime: data.arrivalTime2,
              arrivalCode: data.arrivalCode2,
              duration: data.duration2
            )
          }
        }
        .padding(25)
      }
  }
}
