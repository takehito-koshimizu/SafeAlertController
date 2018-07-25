//
//  AlertControllerStyle.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/24.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

// MARK: - AlertControllerStyle
/// AlertControllerStyle
public protocol AlertControllerStyle {

    /// Style for alert controller.
    static var preferredStyle: UIAlertControllerStyle { get }
}

/// Style for alert.
public struct AlertStyle: AlertControllerStyle, TitleMessageAppendable {

    public typealias TitleMessageAppended = SafeAlertController.AlertTitleMessageAppended<AlertStyle>

    public static var preferredStyle: UIAlertControllerStyle { return .alert }
}

/// Style for action sheets.
public struct ActionSheetStyle: AlertControllerStyle, TitleMessageAppendable {

    public typealias TitleMessageAppended = SafeAlertController.ActionSheetTitleMessageAppended<ActionSheetStyle>

    public static var preferredStyle: UIAlertControllerStyle { return .actionSheet }
}
