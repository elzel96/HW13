//
//  Model.swift
//  HW13
//
//  Created by Helena on 4.07.2023.
//

import UIKit

struct Model {
    var title: String
    var icon: UIImage?
    var iconColor: UIColor
    var additionalInfo: String?
    var alertSign: UIImage?
    var isOn: Bool?
}

extension Model {
    static var allModels: [[Model]] {
        return [
            [
                Model(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconColor: .systemOrange, isOn: true),
                Model(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconColor: .systemBlue, additionalInfo: "Не подключено"),
                Model(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconColor: .systemBlue, additionalInfo: "Вкл."),
                Model(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconColor: .systemGreen),
                Model(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconColor: .systemGreen),
                Model(title: "VPN", icon: UIImage(named: "vpn"), iconColor: .systemBlue, isOn: true)
            ],
            [
                Model(title: "Уведомления", icon: UIImage(named: "bell"), iconColor: .systemRed),
                Model(title: "Звуки, тактильные сигналы", icon: UIImage(named: "sound"), iconColor: .systemPink),
                Model(title: "Не беспокоить", icon: UIImage(named: "moon"), iconColor: .systemPurple),
                Model(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconColor: .systemPurple)
            ],
            [
                Model(title: "Основные", icon: UIImage(systemName: "gear"), iconColor: .gray, alertSign: UIImage(systemName: "exclamationmark.circle.fill")),
                Model(title: "Пункт управления", icon: UIImage(named: "switch"), iconColor: .gray),
                Model(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconColor: .systemBlue),
                Model(title: "Экран «Домой»", icon: UIImage(named: "home"), iconColor: .systemBlue),
                Model(title: "Универсальный доступ", icon: UIImage(named: "accessibility"), iconColor: .systemBlue),
                Model(title: "Обои", icon: UIImage(named: "wallpaper"), iconColor: .link),
                Model(title: "Siri и Поиск", icon: UIImage(named: "siri"), iconColor: .black),
                Model(title: "Face ID и код-пароль", icon: UIImage(named: "face"), iconColor: .systemGreen),
                Model(title: "Экстренный вызов - SOS", icon: UIImage(named: "sos"), iconColor: .systemRed),
                Model(title: "Уведомления о контакте", icon: UIImage(named: "virus"), iconColor: .white),
                Model(title: "Аккумулятор", icon: UIImage(named: "battery"), iconColor: .systemGreen),
                Model(title: "Конфиденциальность \nи безопасность", icon: UIImage(named: "stop"), iconColor: .systemBlue)
            ]
        ]
    }
}
