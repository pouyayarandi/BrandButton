//
//  ViewController.swift
//  BrandButtonExample
//
//  Created by Pouya Yarandi on 3/1/24.
//

import UIKit
import BrandButton

class ViewController: UIViewController {

    private let button = BrandButton()
    private let segment = UISegmentedControl()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegment()
        setupButton()
    }

    private func setButtonAppearance() {
        switch segment.selectedSegmentIndex {
        case 0:
            button.updateWithAnimation = true
            button.variant = .bluePrimary
            button.label = "Button"
            button.leadingIcon = .init(systemName: "checkmark.seal.fill")
            button.trailingIcon = nil
            button.isEnabled = true
        case 1:
            button.updateWithAnimation = true
            button.variant = .greenSecondary
            button.label = "Button"
            button.leadingIcon = nil
            button.trailingIcon = .init(systemName: "checkmark.seal")
            button.isEnabled = true
        case 2:
            button.updateWithAnimation = false
            button.variant = .bluePrimary
            button.label = "Button"
            button.leadingIcon = .init(systemName: "checkmark.seal.fill")
            button.trailingIcon = nil
            button.isEnabled = false
        default:
            break
        }
    }

    @objc private func segmentChanged() {
        setButtonAppearance()
    }

    @objc private func buttonTapped() {
        print("Button tapped")
    }

    private func setupSegment() {
        segment.insertSegment(withTitle: "Primary", at: 0, animated: false)
        segment.insertSegment(withTitle: "Secondary", at: 1, animated: false)
        segment.insertSegment(withTitle: "Disabled", at: 2, animated: false)
        segment.selectedSegmentIndex = 0

        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segment)
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: segment.topAnchor, constant: -8),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: segment.leadingAnchor, constant: -8),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: segment.trailingAnchor, constant: 8)
        ])
    }

    private func setupButton() {
        setButtonAppearance()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: button.centerYAnchor),
        ])
    }

}
