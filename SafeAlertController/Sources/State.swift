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

/// AlertTitleMessageAppended
public struct Init: AlertBuilderState, TitleMessageAppendable {

    public typealias AlertTitleMessageAppended = SafeAlertController.AlertTitleMessageAppended
    public typealias ActionSheetTitleMessageAppended = SafeAlertController.ActionTitleMessageAppended
}


/// AlertTitleMessageAppended
public struct AlertTitleMessageAppended: AlertBuilderState,
TextFieldAppendable, PreferredActionAppendable, ActionAppendable, CancelAppendable {

    public typealias TextFieldAppended = SafeAlertController.AlertTitleMessageAppended
    public typealias ActionAppended = SafeAlertController.ActionAppended
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended
    public typealias CancelAppended = SafeAlertController.CancelAppended
}

/// ActionTitleMessageAppended
public struct ActionTitleMessageAppended: AlertBuilderState,
 PreferredActionAppendable, ActionAppendable, CancelAppendable {


    public typealias ActionAppended = SafeAlertController.ActionAppended
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended
    public typealias CancelAppended = SafeAlertController.CancelAppended
}


/// ActionSheetTitleMessageAppended
public struct ActionSheetTitleMessageAppended: AlertBuilderState,
PreferredActionAppendable, ActionAppendable, CancelAppendable {

    public typealias ActionAppended = SafeAlertController.ActionAppended
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended
    public typealias CancelAppended = SafeAlertController.CancelAppended
}

/// ActionAppended
public struct ActionAppended: AlertBuilderState,
PreferredActionAppendable, ActionAppendable, AlertPresentable, CancelAppendable {

    public typealias ActionAppended = SafeAlertController.ActionAppended
    public typealias PreferredActionAppended = SafeAlertController.PreferredActionAppended
    public typealias CancelAppended = SafeAlertController.CancelAppended
}

/// PreferredActionAppended
public struct PreferredActionAppended: AlertBuilderState,
ActionAppendable, AlertPresentable, CancelAppendable {

    public typealias ActionAppended = SafeAlertController.PreferredActionAppended
    public typealias CancelAppended = SafeAlertController.CancelAppended
}

/// CancelAppended
public struct CancelAppended: AlertBuilderState,
AlertPresentable {

    public typealias CancelAppended = SafeAlertController.CancelAppended
}
