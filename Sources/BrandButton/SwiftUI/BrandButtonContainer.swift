//
//  BrandButtonContainer.swift
//
//
//  Created by Pouya Yarandi on 3/5/24.
//

import UIKit

public class BrandButtonContainer: BrandButton {

    var onTap: (() -> Void)?

    func setTapEvent() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        onTap?()
    }

    func updateContentSize() {
        contentSize = .zero // invalidates intrinsicContentSize
        contentSize = systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
    }

    private var contentSize: CGSize = .zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    public override var intrinsicContentSize: CGSize {
        contentSize
    }
}
