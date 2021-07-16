//
//  PlaylistService.swift
//  Music
//
//  Created by Lucas Sesti on 17/06/21.
//

import Foundation

class PlaylistService {    
    static let shared = PlaylistService();
    
    let baseUrl: String = "https://r0yi8.sse.codesandbox.io/playlist";
    
    func getPlaylist(id: Int, completion: @escaping ([Music]?, Error?) -> ()) {
        guard let url = URL(string: baseUrl + "/" + String(id)) else { return };
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil, err);
                return;
            }
            
            do {
                guard let data: Data = data else { return }
                
                let musics = try JSONDecoder().decode([Music].self, from: data);
                
                completion(musics, nil);
            } catch let err {
                completion(nil, err);
                return;
            }
        }.resume()
        
        
    }
}
