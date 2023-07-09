//
//  CustomTableViewCell.swift
//  HW13
//
//  Created by Helena on 5.07.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var isOn: Bool?
    
    var model: Model? {
        didSet {
            guard let model = model else { return }
            icon.image = model.icon
            title.text = model.title
            icon.image = model.icon
            imageContainer.backgroundColor = model.iconColor
            isOn = model.isOn
            switchButton.isOn = isOn ?? false
            if model.isOn == nil {
                switchButton.isHidden = true
                accessoryType = .disclosureIndicator
            } else { accessoryView = switchButton }
            additionalInfo.text = model.additionalInfo
            if model.additionalInfo == nil {
                additionalInfo.isHidden = true
            }
            if model.alertSign == nil {
                alertSign.isHidden = true
            } else { alertSign.image = model.alertSign }
        }
    }
    
    // MARK: - Outlets
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let additionalInfo: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageContainer: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 5
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.addTarget(self, action: #selector(switchButtonActivated), for: .valueChanged)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    private let alertSign: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(imageContainer)
        addSubview(icon)
        addSubview(title)
        addSubview(additionalInfo)
        addSubview(switchButton)
        addSubview(alertSign)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            imageContainer.heightAnchor.constraint(equalToConstant: 30),
            imageContainer.widthAnchor.constraint(equalToConstant: 30),
            
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            switchButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 280),
            switchButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            
            additionalInfo.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 320),
            additionalInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            alertSign.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 290),
            alertSign.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            alertSign.heightAnchor.constraint(equalToConstant: 25),
            alertSign.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    // MARK: - Action
    
    @objc private func switchButtonActivated() {
        isOn = switchButton.isOn
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        switchButton.isHidden = false
        switchButton.isOn = isOn ?? false
        alertSign.isHidden = false
        additionalInfo.isHidden = false
    }
}
