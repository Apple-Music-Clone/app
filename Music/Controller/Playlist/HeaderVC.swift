//
//  Header.swift
//  Music
//
//  Created by Lucas Sesti on 16/06/21.
//

import UIKit

class PlaylistHeader: UITableViewHeaderFooterView {
    let playlistName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label;
    }()
    
    let authorName: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed;
        
        return label;
    }()
    
    let updatedAt: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2;
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        return label;
    }()
    
    let image: UIImageView = {
        let iv = UIImageView();
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 6
        iv.clipsToBounds = true
        //        iv.clipsToBounds = false
        //        iv.layer.shadowColor = UIColor.black.cgColor
        //        iv.layer.shadowOpacity = 0.2
        //        iv.layer.shadowOffset = CGSize(width: 0, height: 1)
        //        iv.layer.shadowRadius = 2
        
        return iv;
    }()
    
    let reproduceButton: UIButton = {
        let button = UIButton();
        let icon = UIImage(systemName: "play.fill");
        let iconImage = icon?.withRenderingMode(.alwaysTemplate)

        button.tintColor = .systemRed
        
        button.setImage(iconImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Reproduzir", for: .normal)
        button.backgroundColor = .secondarySystemBackground;
        button.layer.cornerRadius = 6
        button.titleEdgeInsets = UIEdgeInsets(top: 6, left: 36, bottom: 6, right: 12)
        
        return button;
    }()
    
    let randomButton: UIButton = {
        let button = UIButton();
        let icon = UIImage(systemName: "shuffle");
        let iconImage = icon?.withRenderingMode(.alwaysTemplate)

        button.tintColor = .systemRed
        
        button.setImage(iconImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
    
        button.setTitle("Aleatório", for: .normal)
        button.backgroundColor = .secondarySystemBackground;
        button.layer.cornerRadius = 6
        button.titleEdgeInsets = UIEdgeInsets(top: 6, left: 36, bottom: 6, right: 12)
        
        return button;
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        let buttonsStack = UIStackView(arrangedSubviews: [reproduceButton, randomButton]);
        buttonsStack.distribution = .fillEqually
        buttonsStack.setCustomSpacing(18, after: reproduceButton);
        
        contentView.backgroundColor = .systemBackground;
        image.translatesAutoresizingMaskIntoConstraints = false
        playlistName.translatesAutoresizingMaskIntoConstraints = false
        authorName.translatesAutoresizingMaskIntoConstraints = false
        updatedAt.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(playlistName)
        contentView.addSubview(authorName)
        contentView.addSubview(updatedAt)
        contentView.addSubview(buttonsStack);
        
        // Center the image vertically and place it near the leading
        // edge of the view. Constrain its width and height to 50 points.
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 210),
            image.heightAnchor.constraint(equalToConstant: 210),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -54),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Center the label vertically, and use it to fill the remaining
            // space in the header view.
            playlistName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 12),
            playlistName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            authorName.topAnchor.constraint(equalTo: playlistName.bottomAnchor),
            authorName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            updatedAt.topAnchor.constraint(equalTo: authorName.bottomAnchor),
            updatedAt.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            buttonsStack.topAnchor.constraint(equalTo: updatedAt.bottomAnchor, constant: 18),
            buttonsStack.heightAnchor.constraint(equalToConstant: 42),
            buttonsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            buttonsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
}
