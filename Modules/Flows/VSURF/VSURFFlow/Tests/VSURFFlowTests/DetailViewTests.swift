import PreviewSnapshotsTesting
import LibraryTestSupport
@testable import VSURFFlow

final class DetailViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        assertSnapshotImagePreviews(of: DetailView_Previews.snapshots,
                                    as: snapshoting(traits: darkTraits))
    }

    func testAllSnapshotsLight() {
        assertSnapshotImagePreviews(of: DetailView_Previews.snapshots,
                                    as: snapshoting(traits: lightTraits))
    }

}
