//
//  SceneDelegate.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}

        window = UIWindow(windowScene: windowScene)
        let store = DataStore()
        let service = EmployeeService(httpClient: HTTPClient.callHTTPClient())
        let configurator = EmployeeConfigurator(service: service, dataStore: store)
        let viewController = configurator.configureViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
