//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class FakeFloatingHintTextFieldSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        assertSnapshotImagePreviews(of: FakeFloatingHintTextField_Previews.snapshots,
                                    as: snapshoting(traits: darkTraits))
    }

    func testAllSnapshotsLight() {
        assertSnapshotImagePreviews(of: FakeFloatingHintTextField_Previews.snapshots,
                                    as: snapshoting(traits: lightTraits))
    }

}
