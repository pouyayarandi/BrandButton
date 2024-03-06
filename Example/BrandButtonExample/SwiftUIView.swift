//
//  SwiftUIView.swift
//  
//
//  Created by Pouya Yarandi on 3/5/24.
//

import SwiftUI
import BrandButton

struct SwiftUIView: View {

    @State private var selection: Int = 0

    private var label: String {
        switch selection {
        case 0: return "Primary Button"
        case 1: return "Secondary Button"
        case 2: return "Disabled Button"
        default: return ""
        }
    }

    private var variant: BrandButton.Variant {
        switch selection {
        case 0, 2: return .bluePrimary
        case 1: return .greenSecondary
        default: return .bluePrimary
        }
    }

    private var leadingIcon: UIImage? {
        selection != 1 ? .init(systemName: "checkmark.seal.fill") : nil
    }

    private var trailingIcon: UIImage? {
        selection == 1 ? .init(systemName: "checkmark.seal") : nil
    }

    @State private var fullWidth: Bool = false
    @State private var sizeMode: BrandButton.Size = .regular

    var body: some View {
        VStack {
            Picker("Style", selection: $selection, content: {
                Text("Primary").tag(0)
                Text("Secondary").tag(1)
                Text("Disabled").tag(2)
            })
            .pickerStyle(.segmented)
            .padding(.top)

            Spacer()

            BrandButtonView(
                label: label,
                variant: variant,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                fullWidth: fullWidth,
                sizeMode: sizeMode
            ) {
                if selection == 0 {
                    fullWidth.toggle()
                } else {
                    sizeMode = sizeMode == .regular ? .medium : .regular
                }
            }
            .disabled(selection == 2)

            Spacer()
        }
        .padding(.horizontal)
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
