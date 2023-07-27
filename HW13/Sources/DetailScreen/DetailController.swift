//
//  DetailViewController.swift
//  HW13
//
//  Created by Helena on 4.07.2023.
//

import UIKit

class DetailController: UIViewController {
    
    var model: Model?
    
    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setups
    
    private func setupView() {
        view = DetailView()
        detailView?.backgroundColor = .systemCyan
        detailView?.label.text = model?.title
    }
}
