//
//  AlertController+Show.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/25.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

// MARK: - AlertPresentable
public extension AlertController where State: AlertPresentable {

    /// Display an alert on the view controller.
    ///
    /// - Parameter presenter: View controller to display alerts.
    /// - Parameter animated: Pass true to animate the presentation; otherwise, pass false.
    /// - Parameter completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    public func show(
        on presenter: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> () = { }) {

        presenter.present(build(), animated: animated, completion: completion)
    }

    /// Display an alert on the root view controller of window owned by application delegate.
    ///
    /// - Parameter animated: Pass true to animate the presentation; otherwise, pass false.
    /// - Parameter completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    public func showOnAppWindowRootViewController(
        animated: Bool = true,
        completion: @escaping () -> () = { }) {

        guard let viewController = UIViewController.rootViewController() else { return }
        show(on: viewController, animated: animated, completion: completion)
    }

    /// Display an alert on the front view controller.
    ///
    /// - Parameter animated: Pass true to animate the presentation; otherwise, pass false.
    /// - Parameter completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    public func showOnMostTopPresentedViewController(
        animated: Bool = true,
        completion: @escaping () -> () = { }) {

        guard let viewController = UIViewController.topViewController() else { return }
        show(on: viewController, animated: animated, completion: completion)
    }

    /// Display an alert on the root view controller of window. We will also create a window for that.
    ///
    /// - Parameter windowLevel: The position of the window in the z-axis.
    /// - Parameter animated: Pass true to animate the presentation; otherwise, pass false.
    /// - Parameter completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    public func showOnNewWindowRootViewController(
        windowLevel: UIWindowLevel = UIWindowLevelAlert,
        animated: Bool = true,
        completion: @escaping () -> () = { }) {

        let window: UIWindow = {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.windowLevel = windowLevel
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
            return window
        }()
        let alert: WindowAlertController = {
            let alert: WindowAlertController = build()
            alert.window = window
            return alert
        }()
        window.rootViewController?.present(alert, animated: animated, completion: completion)
    }
}
