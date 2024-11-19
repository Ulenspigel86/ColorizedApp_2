//
//  ColorDisplayViewController.swift
//  ColorizedApp_1
//
//  Created by Артем Иванов on 17.11.2024.
//

import UIKit

protocol SettingsColorViewControllerDelegate: AnyObject {
    func colorViewValueChanged(_ color: UIColor)
}

final class ColorDisplayViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSettingsVC = segue.destination as? SettingsColorViewController
        colorSettingsVC?.delegate = self
        colorSettingsVC?.viewColor = view.backgroundColor
    }
}

extension ColorDisplayViewController: SettingsColorViewControllerDelegate {
    func colorViewValueChanged(_ color: UIColor) {
        view.backgroundColor = color
    }
}
