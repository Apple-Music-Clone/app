//
//  MusicModel.swift
//  Music
//
//  Created by Lucas Sesti on 13/06/21.
//

class Music: Decodable {
    var explicit: Bool;
    var musicName: String;
    var album: String;
    var artist: String;
    var coverImage: String;
    
    init(explicit: Bool, musicName: String, album: String, artist: String, coverImage: String) {
        self.explicit = explicit;
        self.musicName = musicName;
        self.album = album;
        self.artist = artist;
        self.coverImage = coverImage;
    }
}
