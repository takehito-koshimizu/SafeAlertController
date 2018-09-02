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
            .alert(title: "title", message: "message")
            .default(title: "action", action: performDefault)
            .cancel(title: "cancel", action: performCancel)
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

