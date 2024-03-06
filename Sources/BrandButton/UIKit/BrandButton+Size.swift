//
//  BrandButton+Size.swift
//
//
//  Created by Pouya Yarandi on 3/5/24.
//

import UIKit

extension BrandButton {

    /// Sizing class of the BrandButton
    /// 
    /// It determines the size of the button content.
    public enum Size {
        case regular
        case medium

        var contentHeight: CGFloat {
            switch self {
            case .regular:
                return 24
            case .medium:
                return 32
            }
        }

        var fontSize: CGFloat {
            switch self {
            case .regular:
                return 15
            case .medium:
                return 17
            }
        }

        var fontWeight: UIFont.Weight {
            .bold
        }

        var borderWidth: CGFloat {
            switch self {
            case .regular:
                return 1
            case .medium:
                return 1.5
            }
        }
    }

}
