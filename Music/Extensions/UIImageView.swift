//
//  UIImageView.swift
//  Music
//
//  Created by Lucas Sesti on 13/06/21.
//

import UIKit

extension UIImageView {
    func load(url: String) {
        let newUrl = URL(string: url)!;
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: newUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
