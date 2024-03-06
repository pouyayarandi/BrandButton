//
//  BrandButtonView.swift
//
//
//  Created by Pouya Yarandi on 3/4/24.
//

import SwiftUI

public struct BrandButtonView: UIViewRepresentable {

    private var label: String
    private var variant: BrandButton.Variant
    private var leadingIcon: UIImage?
    private var trailingIcon: UIImage?
    private var fullWidth: Bool
    private var sizeMode: BrandButton.Size
    private var action: () -> Void

    public init(
        label: String,
        variant: BrandButton.Variant = .bluePrimary,
        leadingIcon: UIImage? = nil,
        trailingIcon: UIImage? = nil,
        fullWidth: Bool = false,
        sizeMode: BrandButton.Size = .regular,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.variant = variant
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.fullWidth = fullWidth
        self.sizeMode = sizeMode
        self.action = action
    }

    public func makeUIView(context: Context) -> BrandButton {
        let uiView = BrandButtonContainer()
        uiView.setTapEvent()
        uiView.setContentHuggingPriority(.required, for: .vertical)
        return uiView
    }
    
    public func updateUIView(_ uiView: BrandButton, context: Context) {
        uiView.label = label
        uiView.variant = variant
        uiView.leadingIcon = leadingIcon
        uiView.trailingIcon = trailingIcon
        uiView.sizeMode = sizeMode
        uiView.setContentHuggingPriority(
            fullWidth ? .defaultLow : .required,
            for: .horizontal
        )
        (uiView as? BrandButtonContainer)?.onTap = action
        (uiView as? BrandButtonContainer)?.updateContentSize()
    }

}

struct Preview: PreviewProvider {
    static var previews: some View {
        BrandButtonView(label: "Button", variant: .bluePrimary, leadingIcon: .init(systemName: "swift"), action: {})
    }
}
