//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class AbstractSearchViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        AbstractSearchView_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: darkTraits),
                             record: isRecording)
    }

    func testAllSnapshotsLight() {
        AbstractSearchView_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: lightTraits),
                             record: isRecording)
    }

}
