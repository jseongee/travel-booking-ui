import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var searchString: String = ""
}
