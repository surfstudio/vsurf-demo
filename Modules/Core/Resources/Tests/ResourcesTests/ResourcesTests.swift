//
//  Copyright © Surf. All rights reserved.
//

import XCTest
@testable import Resources

final class ResourcesTests: XCTestCase {

    func testSetColorTheme_fromBaseToPink_isChangingAsset() {

        // Given
        let baseThemeAsset = Asset.Colors.Buttons.Primary.normalBackground

        // When
        ColorTheme.current = .pinkTheme

        // Then
        let pinkThemeAsset = Asset.Colors.Buttons.Primary.normalBackground

        XCTAssertNotEqual(baseThemeAsset.name, pinkThemeAsset.name)
        XCTAssertNotEqual(baseThemeAsset.uiColor, pinkThemeAsset.uiColor)
        XCTAssertNotEqual(baseThemeAsset.color, pinkThemeAsset.color)
    }
}
