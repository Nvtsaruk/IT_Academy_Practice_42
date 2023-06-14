import UIKit

protocol SettingsDelegate {
    func saveTextConfig(_ config: TextConfig)
}

struct TextConfig {
    var text: String
    var textColor: UIColor
    var font: UIFont
    var fontSize: CGFloat
}

