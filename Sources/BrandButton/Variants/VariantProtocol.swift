//
//  VariantProtocol.swift
//
//
//  Created by Pouya Yarandi on 3/2/24.
//

import UIKit

/// Describes appearance of the button for a particular state.
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

/// A protocol that describes the button appearance for normal, 
/// highlighted and disabled states.
public protocol VariantProtocol {

    /// Defines the appearance of the button for the normal state.
    var normalTrait: VariantTrait { get }

    /// Defines the appearance of the button for the highlighted state.
    var highlightedTrait: VariantTrait { get }

    /// Defines the appearance of the button for the disabled state.
    var disabledTrait: VariantTrait { get }
}

extension VariantProtocol {
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
