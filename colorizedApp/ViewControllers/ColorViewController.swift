//
//  ColorViewController.swift
//  colorizedApp
//
//  Created by Kazakov Danil on 11.10.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.color = view.backgroundColor
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        performSegue(withIdentifier: "settingsVC", sender: nil)
    }
    

}
