// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public protocol VariantConfig {
    func borderColor(for state: UIControl.State) -> UIColor
    func backgroundColor(for state: UIControl.State) -> UIColor
    func textColor(for state: UIControl.State) -> UIColor
}

public struct BluePrimaryVariant: VariantConfig {
    public func borderColor(for state: UIControl.State) -> UIColor {
        switch state {
        case .normal: return Color.bluePrimaryDefault.color
        case .highlighted: return Color.bluePrimaryPressed.color
        case .disabled: return Color.grayDisabled.color
        default: return Color.bluePrimaryDefault.color
        }
    }

    public func backgroundColor(for state: UIControl.State) -> UIColor {
        switch state {
        case .normal: return Color.bluePrimaryDefault.color
        case .highlighted: return Color.bluePrimaryPressed.color
        case .disabled: return Color.grayDisabled.color
        default: return Color.bluePrimaryDefault.color
        }
    }

    public func textColor(for state: UIControl.State) -> UIColor {
        .white
    }
}

public enum Variant {
    case bluePrimary
    case custom(VariantConfig)

    var config: VariantConfig {
        switch self {
        case .bluePrimary:
            return BluePrimaryVariant()
        case .custom(let config):
            return config
        }
    }
}

public class BrandButton: UIButton {
    override public func setTitle(_ title: String?, for state: UIControl.State) {}
    override public func setImage(_ image: UIImage?, for state: UIControl.State) {}

    public var variant: Variant = .bluePrimary {
        didSet {
            updateAppearance(animated: false)
        }
    }

    public var updateWithAnimation: Bool = true

    public var variantConfig: VariantConfig {
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
}

private extension UIView {
    static func perform(animated: Bool, block: @escaping () -> Void) {
        if animated {
            UIView.animate(withDuration: 0.15, delay: 0.0, options: [.allowUserInteraction], animations: block)
        } else {
            block()
        }
    }
}
