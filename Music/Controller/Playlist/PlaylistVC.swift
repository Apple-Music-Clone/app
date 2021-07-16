//
//  PlaylistVC.swift
//  Music
//
//  Created by Lucas Sesti on 15/06/21.
//

import UIKit

class PlaylistVC: UIViewController {
    let tableView = UITableView(frame: .zero, style: .grouped);
    let cellId = "musicsCellId";
    let headerId = "musicsHeaderId";
    
    var musics: [Music] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView(){
        view.addSubview(tableView)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .systemBackground;
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.getMusics(id: 1)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView.register(MusicsCell.self, forCellReuseIdentifier: cellId)
        tableView.register(PlaylistHeader.self,
                           forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        setupScrollView()
    }
}

extension PlaylistVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 380;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! PlaylistHeader
        
        view.playlistName.text = "Trap"
        view.authorName.text = "Lucas Buchalla Sesti"
        view.updatedAt.text = "Atualizada há 2 semanas".uppercased()
        
        if (self.musics.count > 0) {
            view.image.load(url: self.musics[0].coverImage)
        }
        
        
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musics.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentIndex = indexPath[1];
        let music = self.musics[currentIndex];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MusicsCell
        cell.artistName.text = music.artist;
        cell.titleLabel.text = music.musicName;
        cell.myImageView.load(url: music.coverImage)
        
        return cell;
    }
}

extension PlaylistVC {
    func getMusics(id: Int) {
        PlaylistService.shared.getPlaylist(id: 1, completion: { (musics, err) in
            if let musics = musics {
                DispatchQueue.main.async {
                    self.musics = musics
                    self.tableView.reloadData()
                }
            }
        })
    }
}
