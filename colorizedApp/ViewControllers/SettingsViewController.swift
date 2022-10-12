//
//  SettingsViewController.swift
//  colorizedApp
//
//  Created by Kazakov Danil on 23.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    @IBOutlet var viewOutlet: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOutlet.layer.cornerRadius = 20
        
        sliderSet(slider: redSlider, color: .red, minimumValue: 0.00, maximumValue: 1.00)
        sliderSet(slider: greenSlider, color: .green, minimumValue: 0.00, maximumValue: 1.00)
        sliderSet(slider: blueSlider, color: .blue, minimumValue: 0.00, maximumValue: 1.00)
    }
    
    @IBAction func setColorAction(_ sender: UIButton) {
        delegate?.fillViewBackGround(viewOutlet.backgroundColor ?? .black)
        dismiss(animated: true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redSlider.value = Float(round(sender.value * 100) / 100.0)
            setValueFor(colorTextField: redTextField, colorLabel: redLabel, slider: redSlider)
        case greenSlider:
            greenSlider.value = Float(round(sender.value * 100) / 100.0)
            setValueFor(colorTextField: greenTextField, colorLabel: greenLabel, slider: greenSlider)
        case blueSlider:
            blueSlider.value = Float(round(sender.value * 100) / 100.0)
            setValueFor(colorTextField: blueTextField, colorLabel: blueLabel, slider: blueSlider)
        default:
            break
        }
        setColor()
        
    }
    
    private func sliderSet(slider: UISlider, color: UIColor, minimumValue: Float, maximumValue: Float) {
        slider.minimumTrackTintColor = color
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
    }
    
    private func setValueFor(colorTextField: UITextField, colorLabel: UILabel, slider: UISlider) {
        colorTextField.text = String(slider.value)
        colorLabel.text = String(slider.value)
        
    }
    
    private func setColor() {
        viewOutlet.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
}
