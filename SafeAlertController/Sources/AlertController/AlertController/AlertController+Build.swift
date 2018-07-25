//
//  AlertController+Build.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/25.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

// MARK: - Build UIAlertController
public extension AlertController where State: AlertPresentable {

    /// Create an instance of the UIAlertController.
    public func build<AlertController: UIAlertController>() -> AlertController {
        let alert = AlertController(
            title: localizable.localized(key: title),
            message: localizable.localized(key: message),
            preferredStyle: State.Style.preferredStyle)
        texts.forEach {
            alert.addTextField(configurationHandler: $0.configuration)
        }
        actions.forEach {
            let action = UIAlertAction(title: localizable.localized(key: $0.title),
                                       style: $0.style,
                                       handler: $0.handler)
            alert.addAction(action)
            if $0.isPreferred {
                alert.preferredAction = action
            }
        }
        return alert
    }
}
