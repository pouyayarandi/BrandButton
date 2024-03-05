//
//  BrandButtonViewTests.swift
//
//
//  Created by Pouya Yarandi on 3/5/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import BrandButton

final class BrandButtonViewTests: XCTestCase {

    private var hostingView: UIHostingController<BrandButtonView>!

    override class func setUp() {
        UIView.setAnimationsEnabled(false)
    }

    override class func tearDown() {
        UIView.setAnimationsEnabled(true)
    }

    override func tearDown() {
        hostingView = nil
        super.tearDown()
    }

    func testBrandButtonView() {
        let dataSet = TestDataGenerator(
            labels: ["SwiftUI Button"],
            variants: [.bluePrimary, .greenSecondary],
            leadingIcons: [.init(systemName: "swift"), nil],
            fullWidths: [false, true]
        ).generate()

        for data in dataSet {
            assertSnapshot(.init(
                label: data.label,
                variant: data.variant,
                leadingIcon: data.leadingIcon,
                fullWidth: data.fullWidth,
                action: {})
            )
        }
    }

    private func assertSnapshot(_ view: BrandButtonView, testName: String = #function) {
        hostingView = .init(rootView: view)
        SnapshotTesting.assertSnapshot(of: hostingView, as: .image(
            precision: 0.99,
            perceptualPrecision: 0.99,
            size: .init(width: 300, height: 100))
        )
    }

}
