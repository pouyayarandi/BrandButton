import XCTest
import SnapshotTesting
@testable import BrandButton

final class BrandButtonTests: XCTestCase {

    var button: BrandButton!
    var container: UIViewController!

    override class func setUp() {
        UIView.setAnimationsEnabled(false)
    }

    override class func tearDown() {
        UIView.setAnimationsEnabled(true)
    }

    override func setUp() {
        super.setUp()
        setupContainer()
        setupButton()
    }

    override func tearDown() {
        button = nil
        container = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testBrandButton_Variants() {
        let generator = TestDataGenerator(
            labels: ["Button"],
            highlights: [false, true],
            variants: [.bluePrimary, .blueSecondary, .greenPrimary, .greenSecondary]
        )
        assertDataSet(generator.generate())
    }

    func testBrandButton_LeadingIcon() {
        let generator = TestDataGenerator(
            labels: ["Leading Icon"],
            highlights: [false, true],
            variants: [.bluePrimary],
            leadingIcons: [.init(systemName: "checkmark.seal.fill")]
        )
        assertDataSet(generator.generate())
    }

    func testBrandButton_TrailingIcon() {
        let generator = TestDataGenerator(
            labels: ["Trailing Icon"],
            highlights: [false, true],
            variants: [.bluePrimary],
            trailingIcons: [.init(systemName: "checkmark.seal.fill")]
        )
        assertDataSet(generator.generate())
    }

    func testBrandButton_Disabled() {
        let generator = TestDataGenerator(
            labels: ["Disabled Button"],
            variants: [.bluePrimary, .blueSecondary],
            enables: [false]
        )
        assertDataSet(generator.generate())
    }

    func testBrandButton_CustomVariant() {
        let variant = PrimaryVariant(
            normalColor: .systemYellow,
            highlightedColor: .systemOrange,
            textColor: .black
        )
        let generator = TestDataGenerator(
            labels: ["Custom Button"],
            highlights: [false, true],
            variants: [.custom(variant)]
        )
        assertDataSet(generator.generate())
    }

    func testBrandButton_FullWidth() {
        let generator = TestDataGenerator(
            labels: ["Full Width Button"],
            variants: [.bluePrimary, .blueSecondary],
            fullWidths: [true]
        )
        assertDataSet(generator.generate())
    }

    func testBrandButton_GetterValues() {
        let image1 = UIImage(systemName: "checkmark.seal.fill")
        let image2 = UIImage(systemName: "checkmark.seal")

        button.label = "Text"
        button.leadingIcon = image1
        button.trailingIcon = image2

        XCTAssertEqual(button.label, "Text")
        XCTAssertEqual(button.leadingIcon, image1)
        XCTAssertEqual(button.trailingIcon, image2)
    }

    // MARK: - Private functions

    private func setupContainer() {
        container = .init()
        container.view.backgroundColor = .white
    }

    private func setupButton() {
        button = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        container.view.addSubview(button)
        NSLayoutConstraint.activate([
            container.view.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            container.view.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }

    private func assertDataSet(
        _ dataSet: [TestDataGenerator.TestData],
        testName: String = #function
    ) {
        for data in dataSet {
            button.label = data.label
            button.isHighlighted = data.isHighlighted
            button.variant = data.variant
            button.leadingIcon = data.leadingIcon
            button.trailingIcon = data.trailingIcon
            button.isEnabled = data.isEnabled
            button.fullWidth = data.fullWidth
            assertSnapshot(testName: testName)
        }
    }

    private func assertSnapshot(testName: String) {
        SnapshotTesting.assertSnapshot(
            of: container,
            as: .image(
                precision: 0.99,
                perceptualPrecision: 0.99,
                size: .init(width: 300, height: 100)
            ),
            testName: testName
        )
    }
}
