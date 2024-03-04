//
//  BrandButton.swift
//
//
//  Created by Pouya Yarandi on 3/2/24.
//

import UIKit

public class BrandButton: UIControl {

    // MARK: - Public properties

    public var variant: VariantType = .bluePrimary {
        didSet {
            updateAppearance(animated: false)
        }
    }

    public var updateWithAnimation: Bool = true

    public var label: String? {
        get {
            textLabel.text
        }
        set {
            textLabel.text = newValue
        }
    }

    public var leadingIcon: UIImage? {
        get {
            leadingIconView.image
        }
        set {
            leadingIconView.isHidden = newValue == nil
            leadingIconView.image = newValue
        }
    }

    public var trailingIcon: UIImage? {
        get {
            trailingIconView.image
        }
        set {
            trailingIconView.isHidden = newValue == nil
            trailingIconView.image = newValue
        }
    }

    // MARK: - Inherited methods

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
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

    // MARK: - Privates

    private var contentStack: UIStackView = .init()
    private var textLabel: UILabel = .init()
    private var leadingIconView: UIImageView = .init()
    private var trailingIconView: UIImageView = .init()

    private func setup() {
        setupButton()
        setupContentStack()
        setupLeadingIconView()
        setupTextLabel()
        setupTrailingIconView()
    }

    private func setupButton() {
        layer.cornerRadius = 4
        layer.borderWidth = 1
    }

    private func setupContentStack() {
        contentStack.spacing = 12
        contentStack.axis = .horizontal
        contentStack.alignment = .center
        contentStack.distribution = .fill
        contentStack.isUserInteractionEnabled = false
        contentStack.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addSubview(contentStack, withInsets: .init(top: 10, leading: 16, bottom: 10, trailing: 16))
    }

    private func setupLeadingIconView() {
        leadingIconView.contentMode = .scaleAspectFit
        leadingIconView.heightAnchor.constraint(equalToConstant: 24)
        leadingIconView.widthAnchor.constraint(equalToConstant: 24)
        leadingIconView.translatesAutoresizingMaskIntoConstraints = false
        leadingIconView.isHidden = true
        contentStack.addArrangedSubview(leadingIconView)
    }

    private func setupTextLabel() {
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        textLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        contentStack.addArrangedSubview(textLabel)
    }

    private func setupTrailingIconView() {
        trailingIconView.contentMode = .scaleAspectFit
        trailingIconView.heightAnchor.constraint(equalToConstant: 24)
        trailingIconView.widthAnchor.constraint(equalToConstant: 24)
        trailingIconView.translatesAutoresizingMaskIntoConstraints = false
        trailingIconView.isHidden = true
        contentStack.addArrangedSubview(trailingIconView)
    }

    private var variantConfig: Variant {
        variant.config
    }

    private func updateAppearance(animated: Bool) {
        let backgroundColor = variantConfig.backgroundColor(for: state)
        let borderColor = variantConfig.borderColor(for: state)
        let textColor = variantConfig.textColor(for: state)
        UIView.perform(animated: animated) { [weak self] in
            self?.backgroundColor = backgroundColor
            self?.layer.borderColor = borderColor.cgColor
            self?.textLabel.textColor = textColor
            self?.tintColor = textColor
        }
    }
}
