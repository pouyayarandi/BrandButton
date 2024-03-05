//
//  SecondaryVariant.swift
//  
//
//  Created by Pouya Yarandi on 3/3/24.
//

import UIKit

public struct SecondaryVariant: VariantProtocol {

    let normalColor: UIColor
    let highlightedColor: UIColor
    let highlightedBackgroundColor: UIColor

    public init(
        normalColor: UIColor,
        highlightedColor: UIColor,
        highlightedBackgroundColor: UIColor
    ) {
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.highlightedBackgroundColor = highlightedBackgroundColor
    }

    public var normalTrait: VariantTrait {
        .init(
            backgroundColor: .white,
            borderColor: normalColor,
            textColor: normalColor
        )
    }

    public var highlightedTrait: VariantTrait {
        .init(
            backgroundColor: highlightedBackgroundColor,
            borderColor: highlightedColor,
            textColor: highlightedColor
        )
    }

    public var disabledTrait: VariantTrait {
        .init(
            backgroundColor: .white,
            borderColor: Color.grayDisabled.color,
            textColor: Color.grayDisabled.color
        )
    }
}
