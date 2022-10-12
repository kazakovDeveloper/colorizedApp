//
//  SettingsViewController.swift
//  colorizedApp
//
//  Created by Kazakov Danil on 23.09.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func fillViewBackGround(red: Float, green: Float, blue: Float)
}

class SettingsViewController: UIViewController {
    
    private var color = Color(redValue: 0.0, greenValue: 0.0, blueValue: 0.0)
    
    var delegate: SettingsViewControllerDelegate!
    
    @IBOutlet var viewOutlet: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOutlet.layer.cornerRadius = 20
        
        sliderSet(slider: redSlider, color: .red, minimumValue: 0.00, maximumValue: 1.00)
        sliderSet(slider: greenSlider, color: .green, minimumValue: 0.00, maximumValue: 1.00)
        sliderSet(slider: blueSlider, color: .blue, minimumValue: 0.00, maximumValue: 1.00)
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is ColorViewController else { return }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            color.redValue = Float(round(sender.value * 100) / 100.0)
            redLabel.text = String(round(color.redValue * 100) / 100.0)
            delegate?.fillViewBackGround(red: color.redValue, green: color.greenValue, blue: color.blueValue)
            viewOutlet.backgroundColor = UIColor(
                red: CGFloat(color.redValue),
                green: CGFloat(color.greenValue),
                blue: CGFloat(color.blueValue),
                alpha: 1
        )
        case greenSlider:
            color.greenValue = Float(round(sender.value * 100) / 100.0)
            greenLabel.text = String(round(color.greenValue * 100) / 100.0)
            delegate?.fillViewBackGround(red: color.redValue, green: color.greenValue, blue: color.blueValue)
            viewOutlet.backgroundColor = UIColor(
                red: CGFloat(color.redValue),
                green: CGFloat(color.greenValue),
                blue: CGFloat(color.blueValue),
                alpha: 1
        )
        case blueSlider:
            color.blueValue = Float(round(sender.value * 100) / 100.0)
            blueLabel.text = String(round(color.blueValue * 100) / 100.0)
            delegate?.fillViewBackGround(red: color.redValue, green: color.greenValue, blue: color.blueValue)
            viewOutlet.backgroundColor = UIColor(
                red: CGFloat(color.redValue),
                green: CGFloat(color.greenValue),
                blue: CGFloat(color.blueValue),
                alpha: 1
        )
        default:
            print("Hello, world")
        }
        
    }
    
    func sliderSet(slider: UISlider, color: UIColor, minimumValue: Float, maximumValue: Float) {
        slider.minimumTrackTintColor = color
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
    }
    
}

extension ColorViewController: SettingsViewControllerDelegate {
    func fillViewBackGround(red: Float, green: Float, blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1)
    }
}
