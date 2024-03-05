//
//  BrandButton+VariantType.swift
//
//
//  Created by Pouya Yarandi on 3/2/24.
//

import UIKit

extension BrandButton {

    public enum Variant {

        case bluePrimary
        case blueSecondary
        case greenPrimary
        case greenSecondary
        case custom(VariantProtocol)

        var config: VariantProtocol {
            switch self {
            case .bluePrimary:
                return PrimaryVariant(
                    normalColor: Color.bluePrimaryDefault.color,
                    highlightedColor: Color.bluePrimaryPressed.color,
                    textColor: .white
                )
            case .blueSecondary:
                return SecondaryVariant(
                    normalColor: Color.bluePrimaryDefault.color,
                    highlightedColor: Color.bluePrimaryPressed.color,
                    highlightedBackgroundColor: Color.blueSecondaryPressed.color
                )
            case .greenPrimary:
                return PrimaryVariant(
                    normalColor: Color.greenPrimaryDefault.color,
                    highlightedColor: Color.greenPrimaryPressed.color,
                    textColor: .white
                )
            case .greenSecondary:
                return SecondaryVariant(
                    normalColor: Color.greenPrimaryDefault.color,
                    highlightedColor: Color.greenPrimaryPressed.color,
                    highlightedBackgroundColor: Color.greenSecondaryPressed.color
                )
            case .custom(let config):
                return config
            }
        }
    }
}
