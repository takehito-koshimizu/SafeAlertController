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

    public static func alert(title: String?, message: String?) -> SafeBuilder<Object, State.AlertTitleMessageAppended> {
        return .init(Object(title: title, message: message, preferredStyle: .alert))
    }

    public static func actionSheet(title: String?, message: String?) -> SafeBuilder<Object, State.ActionSheetTitleMessageAppended> {
        return .init(Object(title: title, message: message, preferredStyle: .actionSheet))
    }
}

// MARK: - TextFieldAppendable
/// TextFieldAppendable
extension SafeBuilder where Object: UIAlertController, State: TextFieldAppendable {

    public func text(configuration: @escaping ((UITextField) -> Void)) -> SafeBuilder<Object, State.TextFieldAppended> {
        return append { alert in
            alert.addTextField(configurationHandler: configuration)
        }
    }
}

// MARK: - PreferredActionAppendable
/// PreferredActionAppendable
extension SafeBuilder where Object: UIAlertController, State: PreferredActionAppendable {

    public func preferredDefault(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.PreferredActionAppended> {
        return append { alert in
            let action = UIAlertAction(title: title, style: .default, handler: action)
            alert.addAction(action)
            alert.preferredAction  = action
        }
    }

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

    public func `default`(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.ActionAppended> {
        return append { alert in
            alert.addAction(UIAlertAction(title: title, style: .default, handler: action))
        }
    }

    public func destructive(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.ActionAppended> {
        return append { alert in
            alert.addAction(UIAlertAction(title: title, style: .destructive, handler: action))
        }
    }
}

// MARK: - CancelAppendable
/// CancelAppendable
extension SafeBuilder where Object: UIAlertController, State: CancelAppendable {

    public func cancel(title: String?, action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> SafeBuilder<Object, State.CancelAppended> {
        return append { alert in
            alert.addAction(UIAlertAction(title: title, style: .cancel, handler: action))
        }
    }
}

// MARK: - AlertPresentable
/// AlertPresentable
public extension SafeBuilder where Object: UIAlertController, State: AlertPresentable {

    public var alert: Object {
        return build()
    }

    public func show(on vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        vc.present(alert, animated: animated, completion: completion)
    }
}

