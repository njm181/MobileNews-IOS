//
//  SceneDelegate.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 08/02/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let nav = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
    }



}

