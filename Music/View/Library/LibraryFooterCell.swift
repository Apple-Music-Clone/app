//
//  LibraryFooterCell.swift
//  Music
//
//  Created by Lucas Sesti on 18/06/21.
//

import UIKit

class LibraryFooterCell: UICollectionViewCell {
    
    var c: CGFloat = 15;
    
    @IBOutlet weak var trailing: NSLayoutConstraint!;
    @IBOutlet weak var leading: NSLayoutConstraint!;
    @IBOutlet weak var top: NSLayoutConstraint!;
    @IBOutlet weak var bottom: NSLayoutConstraint!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    
        let imageContentView = UIView();
        
        contentView.backgroundColor = .systemGray2;
        
        let iv = UIImageView(image: UIImage(systemName: "music.note")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withTintColor(.systemGray3));
        iv.contentMode = .scaleAspectFill;
    
        imageContentView.addSubview(iv);
        
        contentView.layer.cornerRadius = 4
        contentView.addSubview(imageContentView)
        
        
        imageContentView.translatesAutoresizingMaskIntoConstraints = false;
        imageContentView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -30).isActive = true
        imageContentView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -30).isActive = true

        iv.translatesAutoresizingMaskIntoConstraints = false;
        iv.topAnchor.constraint(equalTo: imageContentView.topAnchor).isActive = true;
        iv.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor).isActive = true;
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
    }
}
