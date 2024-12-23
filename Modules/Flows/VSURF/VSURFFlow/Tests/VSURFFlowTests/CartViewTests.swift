import PreviewSnapshotsTesting
import LibraryTestSupport
@testable import VSURFFlow

final class CartViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        assertSnapshotImagePreviews(of: CartView_Previews.snapshots,
                                    as: snapshoting(traits: darkTraits))
    }

    func testAllSnapshotsLight() {
        assertSnapshotImagePreviews(of: CartView_Previews.snapshots,
                                    as: snapshoting(traits: lightTraits))
    }

}
