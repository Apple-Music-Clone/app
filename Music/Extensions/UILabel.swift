//
//  UILabel.swift
//  Music
//
//  Created by Lucas Sesti on 14/06/21.
//

import UIKit

extension UILabel {
    static func textLabel(text: String, fontSize: CGFloat, color: UIColor, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel();
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines;
        label.textColor = color;
        label.text = text;
        
        return label;
    }
}
