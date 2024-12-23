//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class ExceptionViewSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        ExceptionView_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: darkTraits),
                             record: isRecording)
    }

    func testAllSnapshotsLight() {
        ExceptionView_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: lightTraits),
                             record: isRecording)
    }

}
