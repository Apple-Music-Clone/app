//
//  PlayNowHeader.swift
//  Music
//
//  Created by Lucas Sesti on 15/07/21.
//

import UIKit

class PlayNowHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let label: UILabel = {
        let label = UILabel();
        label.text = "Escolhas principais";
        
        return label;
    }()
    
    var collectionView: UICollectionView!;
    
    let cellId = "cellId";
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal;
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        
        collectionView.register(PlayNowHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        let stackView = UIStackView(arrangedSubviews: [label, collectionView])
        stackView.axis = .vertical;
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.fillSuperview()
        
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true;
        label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true;
        label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true;
        label.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true;
        collectionView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true;
        collectionView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true;
        collectionView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true;
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension PlayNowHeader {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlayNowHeaderCell;
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: bounds.width - 48, height: 200)
    }
}
