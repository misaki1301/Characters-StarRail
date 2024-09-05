//
//  File.swift
//  
//
//  Created by Paul Frank on 30/12/23.
//

import Foundation
import UIKit

protocol Coordinator {
	func start()
}

public class ModuleCoordinator: Coordinator {
	
	private let navController: UINavigationController
	private let window: UIWindow
	
	public init(navController: UINavigationController, window: UIWindow) {
		self.navController = navController
		self.window = window
	}
	
	public func start() {
		window.rootViewController = navController
		window.makeKeyAndVisible()
		showMain()
	}
	
	private func showMain() {
		let main = UIStoryboard(name: "View", bundle: Bundle.module)
		let controller = main.instantiateViewController(withIdentifier: "CharacterView") as! CharacterHomeViewController
		let favorite = UIStoryboard(name: "View", bundle: .module).instantiateViewController(withIdentifier: "FavoriteView") as! FavoriteCharacterViewController
		
		favorite.tabBarItem = UITabBarItem(title: "Favorites", image: nil, selectedImage: nil)
		
		controller.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
		let tabBar = UITabBarController()
		tabBar.viewControllers = [controller, favorite]
		navController.pushViewController(tabBar, animated: true)
	}
	
	
}
