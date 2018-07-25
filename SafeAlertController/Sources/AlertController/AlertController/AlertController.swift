//
//  Alert.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

// MARK: -
/// AlertController
public struct AlertController<State, StringConvertible> where State: AlertBuilderState, StringConvertible: CustomStringConvertible {

    let title: StringConvertible?
    let message: StringConvertible?
    let actions: [AlertAction<StringConvertible>]
    let texts: [AlertText]
    let localizable: Localizable

    private init(
        title: StringConvertible? = nil,
        message: StringConvertible? = nil,
        actions: [AlertAction<StringConvertible>] = [],
        texts: [AlertText] = [],
        localizable: Localizable) {

        self.title = title
        self.message = message
        self.actions = actions
        self.texts = texts
        self.localizable = localizable
    }

    /// Add an action to the alert controller.
    private func add<T>(action: AlertAction<StringConvertible>) -> AlertController<T, StringConvertible> {
        var actions = self.actions
        actions.append(action)
        return .init(title: title, message: message, actions: actions, texts: texts, localizable: localizable)
    }
}

// MARK: - Message
public extension AlertController where State: TitleMessageAppendable {

    /// Set the title and message of the alert controller.
    ///
    /// - Parameter title: title of the alert controller.
    /// - Parameter message: message of the alert controller.
    /// - Parameter localizable: Localization table used for generating alert controller. The default parameters are not localized and the string is displayed as it is.
    public static func titleMessage(
        title: StringConvertible?,
        message: StringConvertible?,
        localizer: Localizable = NonLocalizer()) -> AlertController<State.TitleMessageAppended, StringConvertible> {
        return .init(title: title, message: message, localizable: localizer)
    }
}

// MARK: - TextFieldAppendable
public extension AlertController where State: TextFieldAppendable {
    
    /// Add a text field to the alert controller.
    ///
    /// - Parameter configuration: configuration of the text field.
    public func text(configuration: @escaping ((UITextField) -> Void)) -> AlertController<State.TextFieldAppended, StringConvertible> {
        var texts = self.texts
        texts.append(AlertText(configuration: configuration))
        return .init(title: title, message: message, actions: actions, texts: texts, localizable: localizable)
    }
}

// MARK: - PreferredActionAppendable
public extension AlertController where State: PreferredActionAppendable {

    /// Add a preferred default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func preferredDefault(
        title: StringConvertible?,
        action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> AlertController<State.PreferredActionAppended, StringConvertible> {
        return add(action: AlertAction(title: title, style: .default, isPreferred: true, handler: action))
    }

    /// Add a preferred destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func preferredDestructive(
        title: StringConvertible?,
        action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> AlertController<State.PreferredActionAppended, StringConvertible> {
        return add(action: AlertAction(title: title, style: .destructive, isPreferred: true, handler: action))
    }
}

// MARK: - ActionAppendable
public extension AlertController where State: ActionAppendable {

    /// Add a default action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func `default`(
        title: StringConvertible?,
        action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> AlertController<State.ActionAppended, StringConvertible> {
        return add(action: AlertAction(title: title, style: .default, isPreferred: false, handler: action))
    }

    /// Add a destructive action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func destructive(
        title: StringConvertible?,
        action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> AlertController<State.ActionAppended, StringConvertible> {
        return add(action: AlertAction(title: title, style: .destructive, isPreferred: false, handler: action))
    }
}

// MARK: - CancelAppendable
public extension AlertController where State: CancelAppendable {

    /// Add a cancel action to the alert controller.
    ///
    /// - Parameter title: title of the alert action.
    /// - Parameter action: callback handler for the alert action.
    public func cancel(
        title: StringConvertible?,
        action: @escaping ((UIAlertAction) -> Void) = { _ in }) -> AlertController<State.CancelAppended, StringConvertible> {
        return add(action: AlertAction(title: title, style: .cancel, handler: action))
    }
}
