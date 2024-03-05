//
//  BrandButtonView.swift
//
//
//  Created by Pouya Yarandi on 3/4/24.
//

import SwiftUI

public struct BrandButtonView: UIViewRepresentable {

    private var label: String
    private var variant: BrandButton.VariantType
    private var leadingIcon: UIImage?
    private var trailingIcon: UIImage?
    private var fullWidth: Bool
    private var isEnabled: Bool
    private var action: () -> Void

    public init(
        label: String,
        variant: BrandButton.VariantType = .bluePrimary,
        leadingIcon: UIImage? = nil,
        trailingIcon: UIImage? = nil,
        fullWidth: Bool = false,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.variant = variant
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.fullWidth = fullWidth
        self.isEnabled = isEnabled
        self.action = action
    }

    public func makeUIView(context: Context) -> BrandButtonContainer {
        let uiView = BrandButtonContainer()
        uiView.setTapEvent()
        uiView.setContentHuggingPriority(.required, for: .vertical)
        return uiView
    }
    
    public func updateUIView(_ uiView: BrandButtonContainer, context: Context) {
        uiView.label = label
        uiView.variant = variant
        uiView.leadingIcon = leadingIcon
        uiView.trailingIcon = trailingIcon
        uiView.isEnabled = isEnabled
        uiView.onTap = action
        uiView.setContentHuggingPriority(
            fullWidth ? .defaultLow : .required,
            for: .horizontal
        )
        uiView.updateContentSize()
    }

}

struct Preview: PreviewProvider {
    static var previews: some View {
        BrandButtonView(label: "Button", variant: .bluePrimary, leadingIcon: .init(systemName: "swift"), action: {})
    }
}
