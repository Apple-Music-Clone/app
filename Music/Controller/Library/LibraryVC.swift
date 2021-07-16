//
//  LibraryVC.swift
//  Music
//
//  Created by Lucas Sesti on 18/06/21.
//

import UIKit

class LibraryVC: UIViewController {
    let tableMenu = UITableView();
    
    let cellId = "menuCellId"
    let footerId = "menuFooterId";
    
    let menuItems: [MenuItem] = [
        MenuItem(image: "music.note.list", title: "Playlists"),
        MenuItem(image: "music.mic", title: "Artistas"),
        MenuItem(image: "square.stack", title: "Álbuns"),
        MenuItem(image: "music.note", title: "Músicas"),
        MenuItem(image: "square.and.arrow.down", title: "Downloads"),
    ]
    
    func setupViews(){
        view.addSubview(tableMenu)
        
        tableMenu.translatesAutoresizingMaskIntoConstraints = false;
        tableMenu.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        
        tableMenu.register(LibraryMenuCell.self, forCellReuseIdentifier: cellId)
//        tableMenu.register(LibraryFooter.self, forHeaderFooterViewReuseIdentifier: footerId)
        
        let footerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableMenu.frame.width, height: 50))
        let libraryFooter = LibraryFooter().view;
        footerView.addSubview(libraryFooter!)
        footerView.backgroundColor = UIColor.green
        
        tableMenu.tableFooterView = footerView;
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        guard let footerView = self.tableMenu.tableFooterView else {
            return
        }
        let width = self.tableMenu.bounds.size.width
        let size = footerView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height))
        if footerView.frame.size.height != size.height {
            footerView.frame.size.height = size.height
            self.tableMenu.tableFooterView = footerView
        }
    }
}

extension LibraryVC {
    func goToItem(index: Int) -> Void {
        switch (index) {
        case 0:
            self.navigationController?.pushViewController(PlaylistVC(), animated: true)
            
            break
        default:
            print("Não foi possível ir para o item " + String(index))
        }
    }
}

extension LibraryVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId) as! LibraryFooter;
//
//        return footer;
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToItem(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentIndex = indexPath.row;
        let item = self.menuItems[currentIndex];
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! LibraryMenuCell;
        
        cell.title.text = item.title;
        cell.image.image = UIImage(
            systemName: item.image
        )?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withTintColor(.systemPink);
        
        return cell;
    }
}
