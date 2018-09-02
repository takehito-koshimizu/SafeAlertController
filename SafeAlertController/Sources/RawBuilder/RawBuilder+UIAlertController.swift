//
//  RawBuilder+UIAlertController.swift
//  SafeAlertController
//
//  Created by Takehito Koshimizu on 2018/09/02.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

internal extension RawBuilder where Object: UIAlertController {

    static func alert(title: String?, message: String?) -> RawBuilder {
        return .init(Object(title: title, message: message, preferredStyle: .alert))
    }

    static func actionSheet(title: String?, message: String?) -> RawBuilder {
        return .init(Object(title: title, message: message, preferredStyle: .actionSheet))
    }

    /// Add a text field to the alert controller.
    ///
    /// - Parameter configuration: configuration of the text field.
    func text(configuration: @escaping ((UITextField) -> Void)) -> RawBuilder {
        return add { alert in
            alert.addTextField(configurationHandler: configuration)
        }
    }

    /// Add a preferred default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    func preferredDefault(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> RawBuilder {
        return add { alert in
            let action = UIAlertAction(title: title, style: .default, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }

    /// Add a preferred destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    func preferredDestructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> RawBuilder {
        return add { alert in
            let action = UIAlertAction(title: title, style: .destructive, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }

    /// Add a default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    func `default`(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> RawBuilder {
        return add { alert in
            alert.addAction(UIAlertAction(title: title, style: .default, handler: action))
        }
    }

    /// Add a destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    func destructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> RawBuilder {
        return add { alert in
            alert.addAction(UIAlertAction(title: title, style: .destructive, handler: action))
        }
    }

    /// Add a cancel action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    func cancel(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> RawBuilder {
        return add { alert in
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: action))
        }
    }
}

