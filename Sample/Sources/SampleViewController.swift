//
//  ViewController.swift
//  SafeAlertControllersample
//
//  Created by Takehito Koshimizu on 2018/07/27.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit
import SafeAlertController

/// SampleViewController
///
/// A view controller to show how to use Alert Builder.
final class SampleViewController: UITableViewController {}

// MARK: - Basic usage
private extension SampleViewController {

    @objc private func sample0() {
        // Most basic usage.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .default(title: "action", action: performDefault)
            .cancel(title: "cancel", action: performCancel)
            .show(on: self)
    }

    @objc private func sample1() {
        // Add preferred action.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .preferredDefault(title: "action", action: performDefault)
            .cancel(title: "cancel", action: performCancel)
            .show(on: self)
    }

    @objc private func sample2() {
        // Add destructive action.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .destructive(title: "destructive", action: performDestructive)
            .cancel(title: "cancel", action: performCancel)
            .show(on: self)
    }

    @objc private func sample3() {
        // Add three or more actions.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .default(title: "action", action: performDefault)
            .destructive(title: "destructive", action: performDestructive)
            .cancel(title: "cancel", action: performCancel)
            .show(on: self)
    }

    @objc private func sample4() {
        // Add text fields.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .text(configuration: configure)
            .cancel(title: "cancel", action: performCancel)
            .show(on: self)
    }
}

// MARK: - Compile time detection
private extension SampleViewController {

    @objc private func sample5() {
        // Detect before adding an action.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
//            .show(on: self) // ERROR: 'AlertTitleMessageAppended' does not conform to protocol 'AlertPresentable'
            .cancel(title: "cancel")
            .show(on: self)
    }

    @objc private func sample6() {
        // Detect overlapping of preferred actions.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .preferredDefault(title: "action")
//            .preferredDefault(title: "action") // ERROR: 'PreferredActionAppended' does not conform to protocol 'PreferredActionAppendable'
            .default(title: "action")
            .show(on: self)
    }

    @objc private func sample7() {
        // Detect overlapping of cancel actions.
        AlertBuilder
            .titleMessage(title: "title", message: "message")
            .cancel(title: "cancel")
//            .cancel(title: "cancel") // ERROR: 'CancelAppended' does not conform to protocol 'CancelAppendable'
            .show(on: self)
    }

    @objc private func sample8() {
        // Detect addition of text field to action sheet.
        ActionSheetBuilder
            .titleMessage(title: "title", message: "message")
//            .text(configuration: configure) // ERROR: 'ActionSheetStyle.TitleMessageAppended' does not conform to protocol 'TextFieldAppendable'
            .cancel(title: "cancel")
            .show(on: self)
    }
}

// MARK: - String setting
private extension SampleViewController {

    @objc private func sample9() {
        // Localize.
        AlertBuilder
            .titleMessage(title: "title", message: "message", localizer: Localizer()) // Use Localizable.strings in the main bundle.
            .preferredDefault(title: "default")
            .cancel(title: "cancel")
            .show(on: self)
    }

    @objc private func sample10() {
        // Set string enum.
        ConstantAlertBuilder<ConstantStringEnum>
            .titleMessage(title: .title, message: .message)
            .preferredDefault(title: .default)
            .cancel(title: .cancel)
            .show(on: self)
    }

    @objc private func sample11() {
        // Set string enum as the localized string keys.
        ConstantAlertBuilder<ConstantStringEnum>
            .titleMessage(title: .title, message: .message, localizer: Localizer(tableName: "AlertLocalizable"))
            .preferredDefault(title: .default)
            .cancel(title: .cancel)
            .show(on: self)
    }
}

extension SampleViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let label = tableView.cellForRow(at: indexPath)?.textLabel?.text else { return }
        perform(Selector(label))
        tableView.deselectRow(at: indexPath, animated: true)
    }

    private func performDefault(action: UIAlertAction) {
        debugPrint(#function)
    }

    private func performDestructive(action: UIAlertAction) {
        debugPrint(#function)
    }

    private func performCancel(action: UIAlertAction) {
        debugPrint(#function)
    }

    private func configure(text: UITextField) {
        debugPrint(#function)
    }
}

