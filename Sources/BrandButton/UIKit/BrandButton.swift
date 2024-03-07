//
//  BrandButton.swift
//
//
//  Created by Pouya Yarandi on 3/2/24.
//

import UIKit

/// BrandButton is a custom button styled based on Trivago's design system.
public class BrandButton: UIControl {

    // MARK: - Public properties
    
    /// Style of the button based on predefined or custom variants.
    ///
    /// Default variant is bluePrimary.
    public var variant: Variant = .bluePrimary {
        didSet {
            updateAppearance(animated: false)
        }
    }
    
    /// A boolean value indicates the updates of the state should be
    /// applied with animation.
    public var updateWithAnimation: Bool = true
    
    /// A string that is presented on the button
    public var label: String? {
        get {
            textLabel.text
        }
        set {
            textLabel.text = newValue
        }
    }
    
    /// Image which is presented on the leading side of the button.
    ///
    /// The leading of the screen depends on the layout direction.
    public var leadingIcon: UIImage? {
        get {
            leadingIconView.image
        }
        set {
            leadingIconView.isHidden = newValue == nil
            leadingIconView.image = newValue
        }
    }

    /// Image which is presented on the trailing side of the button.
    ///
    /// The trailing of the screen depends on the layout direction.
    public var trailingIcon: UIImage? {
        get {
            trailingIconView.image
        }
        set {
            trailingIconView.isHidden = newValue == nil
            trailingIconView.image = newValue
        }
    }
    
    /// A boolean value indicates the button should be presented in full
    /// width of its superview.
    public var fullWidth: Bool = false {
        didSet {
            widthConstraint?.isActive = fullWidth
        }
    }
    
    /// A size value indicates button should be appeared in which size.
    ///
    /// Size will affect button's height and title's font.
    public var sizeMode: Size = .regular {
        didSet {
            updateSize()
        }
    }
    
    /// A boolean value indicates button is enabled or not.
    public override var isEnabled: Bool {
        didSet {
            updateAppearance(animated: updateWithAnimation)
        }
    }

    /// A boolean value indicates button is highlighted or not.
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
        layer.cornerRadius = Constants.cornerRadius
    }

    private func setupContentStack() {
        contentStack.spacing = Constants.contentSpacing
        contentStack.axis = .horizontal
        contentStack.alignment = .center
        contentStack.distribution = .fill
        contentStack.isUserInteractionEnabled = false
        contentHeightConstraint = contentStack.heightAnchor.constraint(equalToConstant: 0)
        contentHeightConstraint?.isActive = true
        let (v, h) = (Constants.verticalPadding, Constants.horizontalPadding)
        addSubview(contentStack, withInsets: .init(top: v, leading: h, bottom: v, trailing: h))
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

    private var variantConfig: VariantProtocol {
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
