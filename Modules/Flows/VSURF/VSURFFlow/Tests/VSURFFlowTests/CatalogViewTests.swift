import PreviewSnapshotsTesting
import LibraryTestSupport
@testable import VSURFFlow

final class CatalogViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        assertSnapshotImagePreviews(of: CatalogView_Previews.snapshots,
                                    as: snapshoting(traits: darkTraits))
    }

    func testAllSnapshotsLight() {
        assertSnapshotImagePreviews(of: CatalogView_Previews.snapshots,
                                    as: snapshoting(traits: lightTraits))
    }

}
