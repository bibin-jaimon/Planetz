//
//  SceneDelegate.swift
//  Planetz
//
//  Created by Bibin Jaimon on 05/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navController = createRootNavigationController()
        let window = createWindow(
            windowScene: windowScene,
            navController: navController
        )
        self.window = window
    }

}

extension SceneDelegate {
    private func createWindow(windowScene: UIWindowScene, navController: UIViewController) -> UIWindow {
        let newWindow = UIWindow(windowScene: windowScene)
        newWindow.rootViewController = navController
        newWindow.makeKeyAndVisible()
        return newWindow
    }
    
    private func createRootNavigationController() -> UINavigationController {
        let homeViewController = createHomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        return navigationController
    }
    
    private func createHomeViewController() -> HomeViewController {
        /// Based on the identifier we can change the environment
        /// Can save the environment identifier in userdefault and pass it here
        let environment = Environment(identifier: .development)
        let netwoking = Networking(session: .shared)
        let dataStore: DataStoreProtocol = DataStore()
        let planetService: PlanetService = PlanetServiceClient(environment: environment, networking: netwoking)
        let dataFormatter: DataFormatter = JSONFormatter()

        return HomeViewController(
            planetServiceClinet: planetService,
            dataStore: dataStore,
            dataFormatter: dataFormatter
        )
    }
}
