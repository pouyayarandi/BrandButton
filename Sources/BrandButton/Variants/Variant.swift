//
//  VariantConfig.swift
//
//
//  Created by Pouya Yarandi on 3/2/24.
//

import UIKit

public struct VariantTrait {
    let backgroundColor: UIColor
    let borderColor: UIColor
    let textColor: UIColor

    public init(
        backgroundColor: UIColor,
        borderColor: UIColor,
        textColor: UIColor
    ) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.textColor = textColor
    }
}

public protocol Variant {
    var normalTrait: VariantTrait { get }
    var highlightedTrait: VariantTrait { get }
    var disabledTrait: VariantTrait { get }
}

extension Variant {
    func borderColor(for state: UIControl.State) -> UIColor {
        switch state {
        case .normal: return normalTrait.borderColor
        case .highlighted: return highlightedTrait.borderColor
        case .disabled: return disabledTrait.borderColor
        default: return normalTrait.borderColor
        }
    }

    func backgroundColor(for state: UIControl.State) -> UIColor {
        switch state {
        case .normal: return normalTrait.backgroundColor
        case .highlighted: return highlightedTrait.backgroundColor
        case .disabled: return disabledTrait.backgroundColor
        default: return normalTrait.backgroundColor
        }
    }

    func textColor(for state: UIControl.State) -> UIColor {
        switch state {
        case .normal: return normalTrait.textColor
        case .highlighted: return highlightedTrait.textColor
        case .disabled: return disabledTrait.textColor
        default: return normalTrait.textColor
        }
    }
}
