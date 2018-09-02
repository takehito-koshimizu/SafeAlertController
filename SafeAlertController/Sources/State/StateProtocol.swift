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
    associatedtype AlertTitleMessageAppended
    /// State after adding title and massege.
    associatedtype ActionSheetTitleMessageAppended
}

// MARK: -
/// TextFieldAppendable
public protocol TextFieldAppendable {

    /// State after adding preferred action.
    associatedtype TextFieldAppended
}

// MARK: -
/// PreferredActionAppendable
public protocol PreferredActionAppendable {

    /// State after adding preferred action.
    associatedtype PreferredActionAppended
}

// MARK: -
/// ActionAppendable
public protocol ActionAppendable {

    /// State after adding action.
    associatedtype ActionAppended
}

// MARK: -
/// CancelAppendable
public protocol CancelAppendable {

    /// State after adding cancel action.
    associatedtype CancelAppended
}

// MARK: -
/// AlertPresentable
public protocol AlertPresentable {
}

