//
//  CustomizeViewController.swift
//  practice_42
//
//  Created by Tsaruk Nick on 14.06.23.
//

import UIKit

class CustomizeViewController: UIViewController {
    
    var delegate: SettingsDelegate?
    
    var config = TextConfig(text: "Hello World", textColor: .black, font: .systemFont(ofSize: 17), fontSize: 17)
    @IBOutlet weak var textSizeLabel: UILabel!
    @IBOutlet weak var helloWorldButtonOutlet: UIButton!
    var textSize = 0 {
        didSet {
            textSizeLabel.text = String(textSize)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    @IBAction private func saveButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        mainVC.initDelegate = self
        delegate?.saveTextConfig(config)
        navigationController?.popViewController(animated: true)
    }
    @IBAction private func textButton(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                config.text = "Hello World"
            case 1:
                config.text = "Some Label"
            case 2:
                config.text = "Customization"
            case 3:
                config.text = "Delegate App"
            case 4:
                config.textColor = UIColor.black
            case 5:
                config.textColor = UIColor.tintColor
            case 6:
                config.textColor = UIColor.red
            case 7:
                config.textColor = UIColor.green
            case 8:
                config.font = .systemFont(ofSize: 17)
            case 9:
                config.font = .italicSystemFont(ofSize: 17)
            case 10:
                if textSize == 0 {
                    textSize = 0
                } else {
                    textSize -= 1
                }
                config.fontSize = CGFloat(textSize)
            case 11:
                textSize += 1
                config.fontSize = CGFloat(textSize)
            default:
                print("")
        }
    }
}

extension CustomizeViewController: SettingsDelegate {
    func saveTextConfig(_ config: TextConfig) {
        textSize = Int(config.fontSize)
        print("WORKING")
    }
}
