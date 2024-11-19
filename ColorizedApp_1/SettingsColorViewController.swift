//
//  SettingsColorViewController.swift
//  ColorizedApp_1
//
//  Created by Артем Иванов on 14.10.2024.
//

import UIKit

final class SettingsColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet  var colorView: UIView!
    
    @IBOutlet  var redLabel: UILabel!
    @IBOutlet  var greenLabel: UILabel!
    @IBOutlet  var blueLabel: UILabel!
    
    @IBOutlet  var redSlider: UISlider!
    @IBOutlet  var greenSlider: UISlider!
    @IBOutlet  var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var delegate: SettingsColorViewControllerDelegate?
    var viewColor: UIColor!
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        colorView.backgroundColor = viewColor
        
        setValueSliders(for: redSlider, greenSlider, blueSlider)
        setValueLabels(for: redLabel, greenLabel, blueLabel)
        setValueTF(for: redTF, greenTF, blueTF)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValueLabels(for: redLabel)
            setValueTF(for: redTF)
        case greenSlider:
            setValueLabels(for: greenLabel)
            setValueTF(for: greenTF)
        default:
            setValueLabels(for: blueLabel)
            setValueTF(for: blueTF)
        }
        colorValueChanged()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.colorViewValueChanged(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}
    
    // MARK: - Private Methods
   private extension SettingsColorViewController {
        
        func colorValueChanged() {
            colorView.backgroundColor = UIColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1
            )
        }
        
        func setValueLabels(for labels: UILabel...) {
            labels.forEach { label in
                switch label {
                case redLabel: label.text = string(from: redSlider)
                case greenLabel: label.text = string(from: greenSlider)
                default: label.text = string(from: blueSlider)
                }
            }
        }
        
        func setValueTF(for textFields: UITextField...) {
            textFields.forEach { textField in
                switch textField {
                case redTF: textField.text = string(from: redSlider)
                case greenTF: textField.text = string(from: greenSlider)
                default: textField.text = string(from: blueSlider)
                }
            }
        }
        
       func setValueSliders(for colorSliders: UISlider...) {
            let ciColor = CIColor(color: viewColor)
            colorSliders.forEach { slider in
                switch slider {
                case redSlider: redSlider.value = Float(ciColor.red)
                case greenSlider: greenSlider.value = Float(ciColor.green)
                default: blueSlider.value = Float(ciColor.blue)
                }
            }
        }
        
       func string(from slider: UISlider) -> String {
            String(format: "%.2f", slider.value)
        }
    }


     

    
