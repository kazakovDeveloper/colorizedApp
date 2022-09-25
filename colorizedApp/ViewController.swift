//
//  ViewController.swift
//  colorizedApp
//
//  Created by Kazakov Danil on 23.09.2022.
//

import UIKit

    var redValue: Float = 0.00
    var greenValue: Float = 0.00
    var blueValue: Float = 0.00
    
class ViewController: UIViewController {

    @IBOutlet var viewOutlet: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        redSliderSetup()
        greenSliderSetup()
        blueSliderSetup()
    }
    
    private func setupView() {
        viewOutlet.layer.cornerRadius = 20
    }
    
    private func redSliderSetup() {
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumValue = 0.01
        redSlider.maximumValue = 1.0
    }
    
    private func greenSliderSetup() {
        greenSlider.minimumTrackTintColor = .green
        greenSlider.minimumValue = 0.01
        greenSlider.maximumValue = 1.0
        
    }
    private func blueSliderSetup() {
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 0.01
        blueSlider.maximumValue = 1.0
    }


    @IBAction func redSliderAction(_ sender: UISlider) {
        redLabel.text = String(round(redSlider.value * 100) / 100.0)
        redValue = Float(round(redSlider.value * 100) / 100.0)
        viewOutlet.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue),
            alpha: 1
    )
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenLabel.text = String(round(greenSlider.value * 100) / 100.0)
        greenValue = Float(round(greenSlider.value * 100) / 100.0)
        viewOutlet.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue),
            alpha: 1
    )
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueLabel.text = String(round(blueSlider.value * 100) / 100.0)
        blueValue = Float(round(blueSlider.value * 100) / 100.0)
        viewOutlet.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue),
            alpha: 1
    )
    }

}

