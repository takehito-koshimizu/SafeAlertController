//
//  Appendable.swift
//  SafeAlertController
//
//  Created by Takehito Koshimizu on 2018/07/27.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

// MARK: -
/// TitleMessageAppendable
public protocol TitleMessageAppendable {

    /// State after adding title and massege.
    associatedtype TitleMessageAppended: AlertBuilderState
}

// MARK: -
/// TextFieldAppendable
public protocol TextFieldAppendable {

    /// State after adding preferred action.
    associatedtype TextFieldAppended: AlertBuilderState
}

// MARK: -
/// PreferredActionAppendable
public protocol PreferredActionAppendable {

    /// State after adding preferred action.
    associatedtype PreferredActionAppended: AlertBuilderState
}

// MARK: -
/// ActionAppendable
public protocol ActionAppendable {

    /// State after adding action.
    associatedtype ActionAppended: AlertBuilderState
}

// MARK: -
/// CancelAppendable
public protocol CancelAppendable {

    /// State after adding cancel action.
    associatedtype CancelAppended: AlertBuilderState
}

// MARK: -
/// AlertPresentable
public protocol AlertPresentable {

    /// Style for Alert Builder
    associatedtype Style: AlertControllerStyle
}

