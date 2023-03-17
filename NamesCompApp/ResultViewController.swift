//
//  ResultViewController.swift
//  NamesCompApp
//
//  Created by Nikolay Zhukov on 17.03.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    var firstName: String!
    var secondName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        backButton.layer.cornerRadius = 10
        
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
    }

}
