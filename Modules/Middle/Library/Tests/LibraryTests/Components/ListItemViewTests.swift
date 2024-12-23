//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class ListItemViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        assertSnapshotImagePreviews(of: ListItemView_Previews.snapshots,
                                    as: snapshoting(traits: darkTraits))
    }

    func testAllSnapshotsLight() {
        assertSnapshotImagePreviews(of: ListItemView_Previews.snapshots,
                                    as: snapshoting(traits: lightTraits))
    }

}
