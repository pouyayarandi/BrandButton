//
//  PrimaryVariant.swift
//
//
//  Created by Pouya Yarandi on 3/3/24.
//

import UIKit

public struct PrimaryVariant: Variant {

    let normalColor: UIColor
    let highlightedColor: UIColor
    let textColor: UIColor

    public init(
        normalColor: UIColor,
        highlightedColor: UIColor,
        textColor: UIColor
    ) {
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.textColor = textColor
    }

    public var normalTrait: VariantTrait {
        .init(
            backgroundColor: normalColor,
            borderColor: normalColor,
            textColor: textColor
        )
    }

    public var highlightedTrait: VariantTrait {
        .init(
            backgroundColor: highlightedColor,
            borderColor: highlightedColor,
            textColor: textColor
        )
    }

    public var disabledTrait: VariantTrait {
        .init(
            backgroundColor: Color.grayDisabled.color,
            borderColor: Color.grayDisabled.color,
            textColor: .white
        )
    }
}
