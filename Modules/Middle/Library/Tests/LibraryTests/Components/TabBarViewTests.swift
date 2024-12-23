//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class TabBarViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        TabBarView_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: darkTraits),
                             record: isRecording)
    }

    func testAllSnapshotsLight() {
        TabBarView_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: lightTraits),
                             record: isRecording)
    }

}
