//
//  Localizable.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import Foundation

/// Localizable
///
/// provides localization function.
public protocol Localizable {

    /// Get the localized string with the specified key.
    ///
    /// - Parameter key: Key for localization string.
    func localized<S>(key: S?) -> String? where S: CustomStringConvertible


    /// Get the localized string with the specified key.
    ///
    /// - Parameter key: Key for localization string.
    func localized<S>(key: S) -> String where S: CustomStringConvertible
}

public extension Localizable {

    /// Get the localized string with the specified key.
    ///
    /// - Parameter key: Key for localization string.
    public func localized<S>(key: S?) -> String? where S: CustomStringConvertible {
        return key.map(localized)
    }
}

public class NonLocalizer: Localizable {

    public init() {}

    public func localized<S>(key: S) -> String where S : CustomStringConvertible {
        return key.description
    }
}

public class Localizer: Localizable {

    let tableName: String?
    let bundle: Bundle

    /// Initializer
    ///
    /// - Parameters:
    ///   - tableName: The name of the table containing the key-value pairs. Also, the suffix for the strings file (a file with the .strings extension) to store the localized string.
    ///   - bundle: The bundle containing the strings file.
    public init(tableName: String? = nil, bundle: Bundle = .main) {
        self.tableName = tableName
        self.bundle = bundle
    }

    public func localized<S>(key: S) -> String where S : CustomStringConvertible {
        return NSLocalizedString(key.description, tableName: tableName, bundle: bundle, comment: key.description)
    }
}
