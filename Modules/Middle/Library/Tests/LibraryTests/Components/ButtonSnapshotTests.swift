//
//  Copyright © Surf. All rights reserved.
//

import LibraryTestSupport
import SnapshotTesting
import SwiftUI
@testable import Library

final class ButtonSnapshotTests: BaseSnapshotTest {

    // MARK: - Properties

    private let stubText = "Я кнопка"

    // MARK: - Tests

    func testPrimaryButtonLight() {
        assertSnapshotImage(of: stubButton().buttonStyle(.primary),
                            as: snapshoting(traits: lightTraits))
    }

    func testPrimarySmallLight() {
        assertSnapshotImage(of: stubButton().buttonStyle(.primarySmall),
                            as: snapshoting(traits: lightTraits))
    }

    func testSecondaryLight() {
        assertSnapshotImage(of: stubButton().buttonStyle(.secondary),
                            as: snapshoting(traits: lightTraits))
    }

    func testSecondarySmallLight() {
        assertSnapshotImage(of: stubButton().buttonStyle(.secondarySmall),
                            as: snapshoting(traits: lightTraits))
    }

    func testTextCancelLight() {
        assertSnapshotImage(of: stubButton().buttonStyle(.textCancelSearch),
                            as: snapshoting(traits: lightTraits))
    }

    func testTextParagraph2Light() {
        assertSnapshotImage(of: stubButton().buttonStyle(.textParagraph2),
                            as: snapshoting(traits: lightTraits))
    }

    func testTextSystemActionLight() {
        assertSnapshotImage(of: stubButton().buttonStyle(.textSystemAction),
                            as: snapshoting(traits: lightTraits))
    }

    func testPrimaryButtonDark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.primary),
                            as: snapshoting(traits: darkTraits))
    }

    func testPrimarySmallDark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.primarySmall),
                            as: snapshoting(traits: darkTraits))
    }

    func testSecondaryDark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.secondary),
                            as: snapshoting(traits: darkTraits))
    }

    func testSecondarySmallDark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.secondarySmall),
                            as: snapshoting(traits: darkTraits))
    }

    func testTextCancelDark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.textCancelSearch),
                            as: snapshoting(traits: darkTraits))
    }

    func testTextParagraph2Dark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.textParagraph2),
                            as: snapshoting(traits: darkTraits))
    }

    func testTextSystemActionDark() {
        assertSnapshotImage(of: stubButton().buttonStyle(.textSystemAction),
                            as: snapshoting(traits: darkTraits))
    }

}

// MARK: - Private

private extension ButtonSnapshotTests {

    func stubButton() -> some View {
        Button(action: {
            debugPrint("Меня нажали")
        }, label: {
            Text(stubText)
        })
    }

}
