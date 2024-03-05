//
//  TestDataGenerator.swift
//
//
//  Created by Pouya Yarandi on 3/4/24.
//

import UIKit
import BrandButton

struct TestDataGenerator {

    struct TestData {
        let label: String
        let isHighlighted: Bool
        let variant: BrandButton.VariantType
        let leadingIcon: UIImage?
        let trailingIcon: UIImage?
        let isEnabled: Bool
        let fullWidth: Bool
        let sizeMode: BrandButton.Size
    }

    let labels: [String]
    var highlights: [Bool] = [false]
    let variants: [BrandButton.VariantType]
    var leadingIcons: [UIImage?] = [nil]
    var trailingIcons: [UIImage?] = [nil]
    var enables: [Bool] = [true]
    var fullWidths: [Bool] = [false]
    var sizeModes: [BrandButton.Size] = [.regular]

    func generate() -> [TestData] {
        var testData: [TestData] = []

        for label in labels {
            for highlight in highlights {
                for variant in variants {
                    for leadingIcon in leadingIcons {
                        for trailingIcon in trailingIcons {
                            for enable in enables {
                                for fullWidth in fullWidths {
                                    for sizeMode in sizeModes {
                                        testData.append(.init(
                                            label: label,
                                            isHighlighted: highlight,
                                            variant: variant,
                                            leadingIcon: leadingIcon,
                                            trailingIcon: trailingIcon,
                                            isEnabled: enable,
                                            fullWidth: fullWidth,
                                            sizeMode: sizeMode
                                        ))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return testData
    }
}
