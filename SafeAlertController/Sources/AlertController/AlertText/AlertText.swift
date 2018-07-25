//
//  AlertText.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/25.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

/// AlertText
struct AlertText {

    let configuration: ((UITextField) -> Void)

    init(configuration: @escaping ((UITextField) -> Void)) {
        self.configuration = configuration
    }
}
