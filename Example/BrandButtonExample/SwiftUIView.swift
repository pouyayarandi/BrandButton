//
//  SwiftUIView.swift
//  
//
//  Created by Pouya Yarandi on 3/5/24.
//

import SwiftUI
import BrandButton

struct SwiftUIView: View {

    @State var selection: Int = 0

    var label: String {
        switch selection {
        case 0: return "Primary Button"
        case 1: return "Secondary Button"
        case 2: return "Disabled Button"
        default: return ""
        }
    }

    var variant: BrandButton.VariantType {
        switch selection {
        case 0, 2: return .bluePrimary
        case 1: return .greenSecondary
        default: return .bluePrimary
        }
    }

    var isEnabled: Bool {
        selection != 2
    }

    var leadingIcon: UIImage? {
        selection == 0 ? .init(systemName: "checkmark.seal.fill") : nil
    }

    var trailingIcon: UIImage? {
        selection == 1 ? .init(systemName: "checkmark.seal") : nil
    }

    @State var fullWidth: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            Picker("Style", selection: $selection, content: {
                Text("Primary").tag(0)
                Text("Secondary").tag(1)
                Text("Disabled").tag(2)
            }).pickerStyle(.segmented)
                .padding(.top)

            Spacer()

            BrandButtonView(
                label: label,
                variant: variant,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                fullWidth: fullWidth,
                isEnabled: isEnabled
            ) {
                fullWidth.toggle()
            }

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
