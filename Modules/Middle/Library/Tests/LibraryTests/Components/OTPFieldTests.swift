//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import PreviewSnapshotsTesting
@testable import Library

final class OTPFieldSnapshotTests: BaseSnapshotTest {

    // MARK: - Tests

    func testAllSnapshotsDark() {
        OTPField_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: darkTraits),
                             record: isRecording)
    }

    func testAllSnapshotsLight() {
        OTPField_Previews.snapshots
            .assertSnapshots(as: snapshoting(traits: lightTraits),
                             record: isRecording)
    }

}
