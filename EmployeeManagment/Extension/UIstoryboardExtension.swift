//
//  UIstoryboardExtension.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation
import UIKit


//MARK: UIStoryboard extension for instantiate viewController by using identifier
extension UIStoryboard {
    static func instantiate<T: UIViewController>(identifier: StoryboardIdentifier) -> T {
        let storyBoard = UIStoryboard(name: identifier.storyboardName, bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: identifier.rawValue)
        guard let viewController = viewController as? T else{
           fatalError("Error on identifying view controller ")
        }
        return viewController
    }
}
