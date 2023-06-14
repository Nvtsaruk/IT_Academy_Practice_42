//
//  ViewController.swift
//  practice_42
//
//  Created by Tsaruk Nick on 14.06.23.
//

import UIKit

class ViewController: UIViewController {
    
    var initDelegate: SettingsDelegate?
    
    var config = TextConfig(text: "Hello World", textColor: .black, font: .systemFont(ofSize: 17), fontSize: 17)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config.text = "Hello World"
    }
    
    @IBOutlet private weak var customizeLabel: UILabel!
    @IBAction private func goToCustomazeVCAction() {
        let storyboard = UIStoryboard(name: "CustomizeScreen", bundle: nil)
        guard let customizeVC = storyboard.instantiateViewController(withIdentifier: "CustomizeViewController") as? CustomizeViewController else {return}
        customizeVC.delegate = self
        initDelegate?.saveTextConfig(config)
        navigationController?.pushViewController(customizeVC, animated: true)
    }
    

}

extension ViewController: SettingsDelegate {
    func saveTextConfig(_ config: TextConfig) {
        print("First delegate Working")
        customizeLabel.text = config.text
        customizeLabel.font = config.font
        customizeLabel.textColor = config.textColor
        customizeLabel.font = customizeLabel.font.withSize(config.fontSize)
    }
}
