//
//  UIViewExtensions.swift
//
//
//  Created by Pouya Yarandi on 3/3/24.
//

import UIKit

extension UIView {
    static func perform(animated: Bool, block: @escaping () -> Void) {
        if animated {
            UIView.animate(
                withDuration: 0.15,
                delay: 0.0,
                options: [.allowUserInteraction],
                animations: block
            )
        } else {
            block()
        }
    }
}
