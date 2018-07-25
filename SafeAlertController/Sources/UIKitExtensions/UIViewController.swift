//
//  UIViewController.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/24.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

extension UIViewController {

    static func rootViewController() -> UIViewController? {
        return ((UIApplication.shared.delegate)?.window)?
            .flatMap({$0})?
            .rootViewController
    }

    static func topViewController() -> UIViewController? {
        guard let viewController = rootViewController() else { return nil }
        var mostTop: UIViewController = viewController
        while true {
            if let presented = mostTop.presentedViewController {
                mostTop = presented
                continue
            } else {
                break
            }
        }
        return mostTop
    }
}
