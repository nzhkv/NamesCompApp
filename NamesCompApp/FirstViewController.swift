//
//  ViewController.swift
//  NamesCompApp
//
//  Created by Nikolay Zhukov on 17.03.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var yourNameTF: UITextField!
    @IBOutlet weak var partnerNameTF: UITextField!
    @IBOutlet weak var showResultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResultButton.layer.borderWidth = 2
        showResultButton.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        showResultButton.layer.cornerRadius = 10
        
        yourNameTF.borderStyle = .none
        partnerNameTF.borderStyle = .none
        
        yourNameTF.textColor = UIColor.white
        partnerNameTF.textColor = UIColor.white
        
        yourNameTF.attributedPlaceholder = NSAttributedString(
            string: "Your name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText]
        )
        
        partnerNameTF.attributedPlaceholder = NSAttributedString(
            string: "Parthner's name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText]
        )

        let linePathUp = UIBezierPath()
        linePathUp.move(to: CGPoint(x: 30, y: 335))
        linePathUp.addLine(to: CGPoint(x: view.bounds.width - 30, y: 335))

        let lineLayerUp = CAShapeLayer()
        lineLayerUp.strokeColor = UIColor.systemGroupedBackground.cgColor
        lineLayerUp.lineWidth = 2
        lineLayerUp.path = linePathUp.cgPath
        
        let linePathDown = UIBezierPath()
        linePathDown.move(to: CGPoint(x: 30, y: 400))
        linePathDown.addLine(to: CGPoint(x: view.bounds.width - 30, y: 400))

        let lineLayerDown = CAShapeLayer()
        lineLayerDown.strokeColor = UIColor.systemGroupedBackground.cgColor
        lineLayerDown.lineWidth = 2
        lineLayerDown.path = linePathDown.cgPath
        
        view.layer.addSublayer(lineLayerUp)
        view.layer.addSublayer(lineLayerDown)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourNameTF.text
        destinationVC.secondName = partnerNameTF.text
    }

    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnerNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        return true
    }
}

