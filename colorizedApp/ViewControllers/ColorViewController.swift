//
//  ColorViewController.swift
//  colorizedApp
//
//  Created by Kazakov Danil on 11.10.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func fillViewBackGround(_ color: UIColor)
}

class ColorViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.color = view.backgroundColor
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        performSegue(withIdentifier: "settingsVC", sender: nil)
        
    }
    
    
    

}
extension ColorViewController: SettingsViewControllerDelegate {
    func fillViewBackGround(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
