//
//  LibraryMenuCell.swift
//  Music
//
//  Created by Lucas Sesti on 18/06/21.
//

import UIKit

class LibraryMenuCell: UITableViewCell {
    
    let title = UILabel();
    let image: UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit;
        iv.translatesAutoresizingMaskIntoConstraints = false;
        
        return iv;
    }()
    
    let arrow: UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFit;
        iv.image = UIImage(systemName: "chevron.right")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withTintColor(.systemGray3);
        
        return iv;
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground;
        
        let titleInformationStack = UIStackView(arrangedSubviews: [image, title]);
        titleInformationStack.setCustomSpacing(12, after: image)
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [titleInformationStack, arrow]);
        stackView.distribution = .equalSpacing;
        
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true;
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18).isActive = true;
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true;
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true;
        
        image.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 18).isActive = true
        

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
