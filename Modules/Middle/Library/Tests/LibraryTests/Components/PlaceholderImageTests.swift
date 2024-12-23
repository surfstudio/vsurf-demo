//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class PlaceholderImageTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        PlaceholderImage_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: darkTraits),
                             record: isRecording)
    }

    func testAllSnapshotsLight() {
        PlaceholderImage_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: lightTraits),
                             record: isRecording)
    }

}
