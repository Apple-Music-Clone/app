//
//  PlayNowHeaderCell.swift
//  Music
//
//  Created by Lucas Sesti on 15/07/21.
//

import UIKit

class PlayNowHeaderCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel();
        label.text = "Escolhas principais";
        
        return label;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        let stackView = UIStackView(arrangedSubviews: [label])
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.fillSuperview();
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
