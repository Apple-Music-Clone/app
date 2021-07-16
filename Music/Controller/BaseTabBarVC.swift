//
//  BaseTabBarVC.swift
//  Music
//
//  Created by Lucas Sesti on 13/06/21.
//

import UIKit

class BaseTabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        view.backgroundColor = .systemBackground
        
        
        let playNowVC = self.createTabItem(viewController: PlayNowVC(), title: "Ouvir agora", image: "play.circle.fill")
        let exploreVC = self.createTabItem(viewController: UIViewController(), title: "Explorar", image: "square.grid.2x2.fill")
        let radioVC = self.createTabItem(viewController: UIViewController(), title: "Rádio", image: "dot.radiowaves.left.and.right")
        let libraryVC = self.createTabItem(viewController: LibraryVC(), title: "Biblioteca", image: "music.note")
        let searchVC = self.createTabItem(viewController: UIViewController(), title: "Buscar", image: "magnifyingglass")
        
        viewControllers = [playNowVC, exploreVC, radioVC, libraryVC, searchVC]
    }
    
    func createTabItem(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        let controller = UINavigationController(rootViewController: viewController);
        controller.navigationBar.prefersLargeTitles = true

        controller.navigationBar.tintColor = .systemPink

        viewController.navigationItem.title = title;
        viewController.tabBarItem.title = title;
        viewController.tabBarItem.image = UIImage(
            systemName: image
        )?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withTintColor(.systemGray3);
        viewController.tabBarItem.selectedImage = UIImage(
            systemName: image
        )?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal).withTintColor(.systemPink);
       
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemPink], for: .selected)

        
        return controller;
    }
}
