//
//  DetailViewController.swift
//  HW13
//
//  Created by Helena on 4.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var model: Model? {
        didSet {
            guard let model = model else { return }
            label.text = model.title
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = .systemCyan
    }

    private func setupHierarchy() {
        view.addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
