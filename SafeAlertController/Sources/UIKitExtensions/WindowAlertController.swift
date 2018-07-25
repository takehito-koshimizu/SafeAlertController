//
//  WindowAlertController.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/24.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

final class WindowAlertController: UIAlertController {

    var window: UIWindow?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        window = nil
    }
}
