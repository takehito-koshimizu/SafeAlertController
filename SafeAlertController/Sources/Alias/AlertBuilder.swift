//
//  AlertBuilder.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/24.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//


/// Alert builder to set a message with String.
public typealias AlertBuilder = AlertController<Init<AlertStyle>, String>

/// ActionSheet builder to set a message with String.
public typealias ActionSheetBuilder = AlertController<Init<ActionSheetStyle>, String>

/// Alert builder to set the message with CustomStringConvertible.
public typealias ConstantAlertBuilder<StringConvertible>
    = AlertController<Init<AlertStyle>, StringConvertible> where StringConvertible: CustomStringConvertible

/// ActionSheet builder to set the message with CustomStringConvertible.
public typealias ConstantActionSheetBuilder<StringConvertible>
    = AlertController<Init<ActionSheetStyle>, StringConvertible>  where StringConvertible: CustomStringConvertible
