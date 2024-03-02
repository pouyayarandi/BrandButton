//
//  ViewController.swift
//  BrandButtonExample
//
//  Created by Pouya Yarandi on 3/1/24.
//

import UIKit
import BrandButton

class ViewController: UIViewController {

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .systemBackground
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = BrandButton()
        button.variant = .bluePrimary
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    @objc func buttonTapped(_ sender: BrandButton) {
//        sender.isEnabled = false
    }

}
