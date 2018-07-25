//
//  AlertBuilderState.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

// MARK: - AlertBuilderState
/// The state of the alert builder.
public protocol AlertBuilderState {}

/// Init
public struct Init<Style: AlertControllerStyle>: AlertBuilderState, TitleMessageAppendable
where Style: TitleMessageAppendable {

    public typealias TitleMessageAppended = Style.TitleMessageAppended
}

/// AlertTitleMessageAppended
public struct AlertTitleMessageAppended<Style: AlertControllerStyle>: AlertBuilderState,
TextFieldAppendable, PreferredActionAppendable, ActionAppendable, CancelAppendable {

    public typealias TextFieldAppended = SafeAlertController.AlertTitleMessageAppended<Style>
    public typealias ActionAppended = SafeAlertController.ActionAppended<Style>
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended<Style>
    public typealias CancelAppended = SafeAlertController.CancelAppended<Style>
}

/// ActionSheetTitleMessageAppended
public struct ActionSheetTitleMessageAppended<Style: AlertControllerStyle>: AlertBuilderState,
PreferredActionAppendable, ActionAppendable, CancelAppendable {

    public typealias ActionAppended = SafeAlertController.ActionAppended<Style>
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended<Style>
    public typealias CancelAppended = SafeAlertController.CancelAppended<Style>
}

/// ActionAppended
public struct ActionAppended<Style: AlertControllerStyle>: AlertBuilderState,
PreferredActionAppendable, ActionAppendable, AlertPresentable, CancelAppendable {

    public typealias ActionAppended = SafeAlertController.ActionAppended<Style>
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended<Style>
    public typealias CancelAppended = SafeAlertController.CancelAppended<Style>
}

/// PreferredActionAppended
public struct PreferredActionAppended<Style: AlertControllerStyle>: AlertBuilderState,
ActionAppendable, AlertPresentable, CancelAppendable {

    public typealias ActionAppended = SafeAlertController.PreferredActionAppended<Style>
    public typealias CancelAppended = SafeAlertController.CancelAppended<Style>
}

/// CancelAppended
public struct CancelAppended<Style: AlertControllerStyle>: AlertBuilderState,
AlertPresentable {

    public typealias CancelAppended = SafeAlertController.CancelAppended<Style>
}
