//
//  Alert.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

public typealias AlertBuilder = StateController<Init>

public struct StateController<State> {

    let alert: UIAlertController

    func perform<T>(sideEffect: (UIAlertController) -> ()) -> StateController<T> {
        sideEffect(alert)
        return unsafeBitCast(self, to: StateController<T>.self)
    }
}

extension StateController where State: TitleMessageAppendable {

    public static func alert(title: String?, message: String?) -> StateController<State.AlertTitleMessageAppended> {
        return .init(alert: .init(title: title, message: message, preferredStyle: .alert))
    }

    public static func actionSheet(title: String?, message: String?) -> StateController<State.ActionSheetTitleMessageAppended> {
        return .init(alert: .init(title: title, message: message, preferredStyle: .actionSheet))
    }
}

extension StateController where State: TextFieldAppendable {

    /// Add a text field to the alert controller.
    ///
    /// - Parameter configuration: configuration of the text field.
    public func text(configuration: @escaping ((UITextField) -> Void)) -> StateController<State.TextFieldAppended> {
        return perform { alert in
            alert.addTextField(configurationHandler: configuration)
        }
    }
}

extension StateController where State: PreferredActionAppendable {

    /// Add a preferred default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func preferredDefault(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> StateController<State.PreferredActionAppended> {
        return perform { alert in
            let action = UIAlertAction(title: title, style: .default, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }

    /// Add a preferred destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func preferredDestructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> StateController<State.PreferredActionAppended> {
        return perform { alert in
            let action = UIAlertAction(title: title, style: .destructive, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }
}

extension StateController where State: ActionAppendable {

    /// Add a default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func `default`(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> StateController<State.ActionAppended> {
        return perform { alert in
            alert.addAction(UIAlertAction(title: title, style: .default, handler: action))
        }
    }

    /// Add a destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func destructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> StateController<State.ActionAppended> {
        return perform { alert in
            alert.addAction(UIAlertAction(title: title, style: .destructive, handler: action))
        }
    }
}

extension StateController where State: CancelAppendable {

    /// Add a cancel action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func cancel(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> StateController<State.CancelAppended> {
        return perform { alert in
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: action))
        }
    }
}

public extension StateController where State: AlertPresentable {

    public var alertController: UIAlertController {
        return alert
    }
}
