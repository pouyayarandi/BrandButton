//
//  BrandButton.swift
//
//
//  Created by Pouya Yarandi on 3/2/24.
//

import UIKit

public class BrandButton: UIButton {

    public var variant: VariantType = .bluePrimary {
        didSet {
            updateAppearance(animated: false)
        }
    }

    public var updateWithAnimation: Bool = true

    public var variantConfig: Variant {
        variant.config
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer.cornerRadius = 4
        layer.borderWidth = 1
    }

    public override var isEnabled: Bool {
        didSet {
            updateAppearance(animated: updateWithAnimation)
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            updateAppearance(animated: updateWithAnimation)
        }
    }

    private func updateAppearance(animated: Bool) {
        let backgroundColor = variantConfig.backgroundColor(for: state)
        let borderColor = variantConfig.borderColor(for: state)
        UIView.perform(animated: animated) { [weak self] in
            self?.backgroundColor = backgroundColor
            self?.layer.borderColor = borderColor.cgColor
        }
    }

    override public func setTitle(_ title: String?, for state: UIControl.State) {}
    override public func setImage(_ image: UIImage?, for state: UIControl.State) {}
}
