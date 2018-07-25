//
//  AlertAction.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

// MARK: -
/// AlertAction
struct AlertAction<S> where S: CustomStringConvertible  {

    let title: S?
    let style: UIAlertActionStyle
    let handler: ((UIAlertAction) -> Void)
    let isPreferred: Bool

    init(title: S?, style: UIAlertActionStyle, isPreferred: Bool = false, handler: @escaping ((UIAlertAction) -> Void) = { _ in }) {
        self.title = title
        self.style = style
        self.handler = handler
        self.isPreferred = isPreferred
    }
}
