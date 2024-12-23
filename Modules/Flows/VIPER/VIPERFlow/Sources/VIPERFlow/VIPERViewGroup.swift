import Cart
import PreviewSnapshots
import Resources
import SwiftUI

// MARK: - ViewGroup

public struct VIPERViewGroup: View {

    // MARK: - Properties

    private static let model: Model = .init()

    // MARK: - Init

    public init() {}

    // MARK: - View

    public var body: some View {
        NavigationStack {
            CatalogView(presenter:
                    .init(interactor: .init(model: VIPERViewGroup.model),
                          router: .init()
                    )
            )
            .navigationTitle("Items")
        }
    }

}
