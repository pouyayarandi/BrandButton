//
//  Colors.swift
//
//
//  Created by Pouya Yarandi on 3/1/24.
//

import UIKit

enum Color: String {
    case bluePrimaryDefault = "blue.primary.default"
    case bluePrimaryPressed = "blue.primary.pressed"
    case blueSecondaryPressed = "blue.secondary.pressed"
    case greenPrimaryDefault = "green.primary.default"
    case greenPrimaryPressed = "green.primary.pressed"
    case greenSecondaryPressed = "green.secondary.pressed"
    case gray
    case white
}

extension Color {
    var color: UIColor {
        .init(named: rawValue)
    }
}
