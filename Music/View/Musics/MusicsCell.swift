//
//  MusicsView.swift
//  Music
//
//  Created by Lucas Sesti on 13/06/21.
//

import UIKit

class MusicsCell: UITableViewCell {   
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let optionsIcon: UIImageView = {
        let image = UIImage(systemName: "ellipsis");
        let imageView = UIImageView();
        
        imageView.image = image;
        imageView.image!.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let artistName: UILabel = .textLabel(text: "", fontSize: 14, color: .systemGray3);
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground;
        
        let artistInformationStack = UIStackView(arrangedSubviews: [titleLabel, artistName]);
        artistInformationStack.axis = .vertical
        
        let musicInformationStack = UIStackView(arrangedSubviews: [myImageView, artistInformationStack])
        let actionsStack = UIStackView(arrangedSubviews: [optionsIcon])
        
        let stackView = UIStackView(arrangedSubviews: [musicInformationStack, actionsStack]);
        stackView.distribution = .equalSpacing;
        
        
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        musicInformationStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false;
        
        myImageView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
        musicInformationStack.setCustomSpacing(12, after: myImageView);
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
