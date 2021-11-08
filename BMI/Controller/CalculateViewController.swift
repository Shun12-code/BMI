//
//  ViewController.swift
//  BMI
//
//  Created by 野村俊介 on 2021/11/08.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    @IBOutlet weak var heightTextLabel: UILabel!
    @IBOutlet weak var weightTextLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightTextLabel.text = "\(height)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightTextLabel.text = "\(weight)Kg"
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
//        これでsegueであるtoResultを通して次の画面へ遷移する
        self.performSegue(withIdentifier: "toResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
//            segue.destination（行き先）がUIViewControllerだったからResultViewControllerにダウンキャストをする
            let destiationVC = segue.destination as! ResultViewController
            destiationVC.bmiValue = calculatorBrain.getBMIValue()
            destiationVC.advice = calculatorBrain.getAdvice()
            destiationVC.color = calculatorBrain.getColor()
        }
    }
    
}

