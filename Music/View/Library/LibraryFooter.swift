//
//  LibraryFooter.swift
//  Music
//
//  Created by Lucas Sesti on 18/06/21.
//

import UIKit

class LibraryFooter: UIViewController {
    let cellId = "cellId";
    
    private var edgeInsetPadding = 10
    
    private var numberOfItemsInRow = 2
    
    private var minimumSpacing = 5
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let layout = UICollectionViewFlowLayout();
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout);
        
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(LibraryFooterCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(collectionView);
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true;
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true;
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true;
    }
    
}

extension LibraryFooter: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        edgeInsetPadding = Int(inset.left+inset.right)
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(minimumSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(minimumSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (Int(UIScreen.main.bounds.size.width) - minimumSpacing - edgeInsetPadding) / 2;
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LibraryFooterCell;
        
        
        return cell
    }
    
}
