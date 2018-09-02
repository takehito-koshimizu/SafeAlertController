//
//  AlertBuilderState.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

/// AlertBuilderState
public enum AlertBuilderState {

    /// Init
    public struct Init: TitleMessageAppendable {
        public typealias AlertTitleMessageAppended = AlertBuilderState.AlertTitleMessageAppended
        public typealias ActionSheetTitleMessageAppended = AlertBuilderState.ActionTitleMessageAppended
    }

    /// AlertTitleMessageAppended
    public struct AlertTitleMessageAppended: TextFieldAppendable, PreferredActionAppendable, ActionAppendable, CancelAppendable {
        public typealias TextFieldAppended = AlertBuilderState.AlertTitleMessageAppended
        public typealias ActionAppended = AlertBuilderState.ActionAppended
        public typealias PreferredActionAppended = AlertBuilderState.PreferredActionAppended
        public typealias CancelAppended = AlertBuilderState.CancelAppended
    }

    /// ActionTitleMessageAppended
    public struct ActionTitleMessageAppended: PreferredActionAppendable, ActionAppendable, CancelAppendable {
        public typealias ActionAppended = AlertBuilderState.ActionAppended
        public typealias PreferredActionAppended = AlertBuilderState.PreferredActionAppended
        public typealias CancelAppended = AlertBuilderState.CancelAppended
    }

    /// ActionSheetTitleMessageAppended
    public struct ActionSheetTitleMessageAppended: PreferredActionAppendable, ActionAppendable, CancelAppendable {
        public typealias ActionAppended = AlertBuilderState.ActionAppended
        public typealias PreferredActionAppended = AlertBuilderState.PreferredActionAppended
        public typealias CancelAppended = AlertBuilderState.CancelAppended
    }

    /// ActionAppended
    public struct ActionAppended: PreferredActionAppendable, ActionAppendable, AlertPresentable, CancelAppendable {
        public typealias ActionAppended = AlertBuilderState.ActionAppended
        public typealias PreferredActionAppended = AlertBuilderState.PreferredActionAppended
        public typealias CancelAppended = AlertBuilderState.CancelAppended
    }

    /// PreferredActionAppended
    public struct PreferredActionAppended: ActionAppendable, AlertPresentable, CancelAppendable {
        public typealias ActionAppended = AlertBuilderState.PreferredActionAppended
        public typealias CancelAppended = AlertBuilderState.CancelAppended
    }

    /// CancelAppended
    public struct CancelAppended:  AlertPresentable {
        public typealias CancelAppended = AlertBuilderState.CancelAppended
    }
}
