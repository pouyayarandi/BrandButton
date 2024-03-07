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
                withDuration: Constants.animationDuration,
                delay: Constants.animationDelay,
                options: [.allowUserInteraction],
                animations: block
            )
        } else {
            block()
        }
    }

    func addSubview(_ view: UIView, withInsets insets: NSDirectionalEdgeInsets) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: insets.leading),
            view.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -insets.trailing)
        ])
    }
}
