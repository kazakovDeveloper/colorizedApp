//
//  ColorViewController.swift
//  colorizedApp
//
//  Created by Kazakov Danil on 11.10.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    var color = Color()

    override func viewDidLoad() {
        super.viewDidLoad()
        fillViewBackGround(red: color.redValue, green: color.greenValue, blue: color.blueValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? SettingsViewController else { return }
        colorVC.delegate = self
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        performSegue(withIdentifier: "settingsVC", sender: nil)
    }

}
