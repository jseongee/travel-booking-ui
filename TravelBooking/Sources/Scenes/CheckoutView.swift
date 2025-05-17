import SwiftUI

struct CheckoutView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.colorScheme) private var colorScheme

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 40) {
        // MARK: - Title
        VStack(alignment: .leading, spacing: 0) {
          Text("Your Trip")
            .foregroundStyle(.secondary)
            .font(.footnote)

          HStack(spacing: 0) {
            Text("SFO - NYC")
              .font(.title3)
              .bold()

            FlightTypeButton(
              isClickable: false,
              isSelected: true,
              label: FlightType.oneWay.rawValue,
              icon: "arrow.right.circle.fill"
            )
            .scaleEffect(0.8)
          }

          Text("5 July 2020")
            .foregroundStyle(.secondary)
            .font(.footnote)
        }

        // MARK: - Tickets
        ForEach(sampleTickets) { ticket in
          Ticket(data: ticket)
        }

        // MARK: - Checkout Button
        Button {

        } label: {
          Text("Checkout")
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .font(.title3)
        }
        .buttonStyle(.borderedProminent)
        .tint(AppColor.primary(colorScheme))
        .shadow(color: AppColor.primary(colorScheme).opacity(0.15), radius: 10, x: 0, y: 10)
        .bold()
      }
      .padding(.horizontal, 20)
      .padding(.top, 30)
      .navigationBarBackButtonHidden()
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .bold()
              .tint(.primary)
          }
        }

        ToolbarItem(placement: .principal) {
          Text("Select Ticket")
            .font(.title2)
            .bold()
            .tint(.primary)
        }

        ToolbarItem(placement: .topBarTrailing) {
          Image(systemName: "line.3.horizontal")
            .bold()
        }
      }
    }
  }

}

#Preview {
  CheckoutView()
}
