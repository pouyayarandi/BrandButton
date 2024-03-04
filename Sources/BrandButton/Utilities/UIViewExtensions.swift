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

    func addSubview(_ view: UIView, withInsets insets: NSDirectionalEdgeInsets) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.leading),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insets.trailing)
        ])
    }
}
