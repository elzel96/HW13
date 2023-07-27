//
//  ViewController.swift
//  HW13
//
//  Created by Helena on 3.07.2023.
//

import UIKit

class MainController: UIViewController {
    
    private var model = Model.allModels

    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setups
    
    private func setupView() {
        view = MainView()
        title = "Настройки"
        mainView?.backgroundColor = .systemBackground
        mainView?.tableView.delegate = self
        mainView?.tableView.dataSource = self
    }
}

// MARK: - Extensions

extension MainController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.model = model[indexPath.section][indexPath.row]
        cell?.onChanged = { [weak self] state in
            self?.model[indexPath.section][indexPath.row].isOn = state
        }
        return cell ?? UITableViewCell()
    }
}

extension MainController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 && indexPath.row == 11 {
            return 60
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) 
        
        print("Нажата ячейка \(model[indexPath.section][indexPath.row].title)")
        
        if indexPath.section == 0 && ( indexPath.row == 0 || indexPath.row == 5 ) {
        } else {
            let viewController = DetailController()
            viewController.model = model[indexPath.section][indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
