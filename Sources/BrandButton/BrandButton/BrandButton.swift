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

    public var fullWidth: Bool = false {
        didSet {
            widthConstraint?.isActive = fullWidth
        }
    }

    public var sizeMode: Size = .regular {
        didSet {
            updateSize()
        }
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

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview else { return }
        widthConstraint = widthAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.widthAnchor)
        widthConstraint?.priority = .defaultLow
        widthConstraint?.isActive = fullWidth
    }

    // MARK: - Privates

    private var contentStack: UIStackView = .init()
    private var textLabel: UILabel = .init()
    private var leadingIconView: UIImageView = .init()
    private var trailingIconView: UIImageView = .init()
    private var contentHeightConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?

    private func setup() {
        setupButton()
        setupContentStack()
        setupLeadingIconView()
        setupTextLabel()
        setupTrailingIconView()
        updateSize()
    }

    private func setupButton() {
        layer.cornerRadius = 4
    }

    private func setupContentStack() {
        contentStack.spacing = 12
        contentStack.axis = .horizontal
        contentStack.alignment = .center
        contentStack.distribution = .fill
        contentStack.isUserInteractionEnabled = false
        contentHeightConstraint = contentStack.heightAnchor.constraint(equalToConstant: 0)
        contentHeightConstraint?.isActive = true
        addSubview(contentStack, withInsets: .init(top: 10, leading: 16, bottom: 10, trailing: 16))
        contentStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func setupLeadingIconView() {
        leadingIconView.contentMode = .scaleAspectFit
        contentStack.addArrangedSubview(leadingIconView)
        leadingIconView.heightAnchor.constraint(equalTo: contentStack.heightAnchor).isActive = true
        leadingIconView.widthAnchor.constraint(equalTo: leadingIconView.heightAnchor).isActive = true
        leadingIconView.translatesAutoresizingMaskIntoConstraints = false
        leadingIconView.isHidden = true
    }

    private func setupTextLabel() {
        textLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        contentStack.addArrangedSubview(textLabel)
    }

    private func setupTrailingIconView() {
        trailingIconView.contentMode = .scaleAspectFit
        contentStack.addArrangedSubview(trailingIconView)
        trailingIconView.heightAnchor.constraint(equalTo: contentStack.heightAnchor).isActive = true
        trailingIconView.widthAnchor.constraint(equalTo: trailingIconView.heightAnchor).isActive = true
        trailingIconView.translatesAutoresizingMaskIntoConstraints = false
        trailingIconView.isHidden = true
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

    private func updateSize() {
        contentHeightConstraint?.constant = sizeMode.contentHeight
        textLabel.font = UIFont.systemFont(ofSize: sizeMode.fontSize, weight: sizeMode.fontWeight)
        layer.borderWidth = sizeMode.borderWidth
    }
}
