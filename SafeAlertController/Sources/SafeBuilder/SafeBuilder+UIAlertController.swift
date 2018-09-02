//
//  SafeBuilder+UIAlertController.swift
//  SafeAlertController
//
//  Created by Takehito Koshimizu on 2018/08/05.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

// MARK: - AlertBuilder
/// AlertBuilder
public typealias AlertBuilder<AlertController> = SafeBuilder<AlertController, AlertBuilderState.Init> where AlertController: UIAlertController

// MARK: - TitleMessageAppendable
/// TitleMessageAppendable
extension SafeBuilder where Object: UIAlertController, State: TitleMessageAppendable {

    /// Set the title and message of the alert.
    ///
    /// - Parameter title: title of the alert controller.
    /// - Parameter message: message of the alert controller.
    public static func alert(title: String?, message: String?) -> SafeBuilder<Object, State.AlertTitleMessageAppended> {
        return .init(Object(title: title, message: message, preferredStyle: .alert))
    }

    /// Set the title and message of the actionSheet.
    ///
    /// - Parameter title: title of the alert controller.
    /// - Parameter message: message of the alert controller.
    public static func actionSheet(title: String?, message: String?) -> SafeBuilder<Object, State.ActionSheetTitleMessageAppended> {
        return .init(Object(title: title, message: message, preferredStyle: .actionSheet))
    }
}

// MARK: - TextFieldAppendable
/// TextFieldAppendable
extension SafeBuilder where Object: UIAlertController, State: TextFieldAppendable {

    /// Add a text field to the alert controller.
    ///
    /// - Parameter configuration: configuration of the text field.
    public func text(configuration: @escaping ((UITextField) -> Void)) -> SafeBuilder<Object, State.TextFieldAppended> {
        return append { alert in
            alert.addTextField(configurationHandler: configuration)
        }
    }
}

// MARK: - PreferredActionAppendable
/// PreferredActionAppendable
extension SafeBuilder where Object: UIAlertController, State: PreferredActionAppendable {

    /// Add a preferred default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func preferredDefault(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.PreferredActionAppended> {
        return append { alert in
            let action = UIAlertAction(title: title, style: .default, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }

    /// Add a preferred destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func preferredDestructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.PreferredActionAppended> {
        return append { alert in
            let action = UIAlertAction(title: title, style: .destructive, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }
}

// MARK: - ActionAppendable
/// ActionAppendable
extension SafeBuilder where Object: UIAlertController, State: ActionAppendable {

    /// Add a default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func `default`(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.ActionAppended> {
        return append { alert in
            alert.addAction(UIAlertAction(title: title, style: .default, handler: action))
        }
    }

    /// Add a destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func destructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.ActionAppended> {
        return append { alert in
            alert.addAction(UIAlertAction(title: title, style: .destructive, handler: action))
        }
    }
}

// MARK: - CancelAppendable
/// CancelAppendable
extension SafeBuilder where Object: UIAlertController, State: CancelAppendable {

    /// Add a cancel action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func cancel(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.CancelAppended> {
        return append { alert in
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: action))
        }
    }
}

// MARK: - AlertPresentable
/// AlertPresentable
public extension SafeBuilder where Object: UIAlertController, State: AlertPresentable {

    /// build UIAlertController.
    public var alert: Object {
        return build()
    }

    /// Display an alert on the view controller.
    ///
    /// - Parameters:
    ///   - vc: view controller
    ///   - animated: Pass true to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    public func show(on vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        vc.present(alert, animated: animated, completion: completion)
    }
}

