//
//  PrimaryVariant.swift
//
//
//  Created by Pouya Yarandi on 3/3/24.
//

import UIKit

/// Built in variant protocol conformance which defines primary button style.
public struct PrimaryVariant: VariantProtocol {

    let normalColor: UIColor
    let highlightedColor: UIColor
    let textColor: UIColor

    /// Initialization of the primary variant
    /// - Parameters:
    ///   - normalColor: The color which is used for background in normal state.
    ///   - highlightedColor: The color which is used for background in highlighted state.
    ///   - textColor: The color which is used for button label in both normal and highlighted state.
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
