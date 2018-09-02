//
//  Builder.swift
//  SafeAlertController
//
//  Created by Takehito Koshimizu on 2018/08/02.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

import UIKit

final class RawBuilder<Object: AnyObject> {

    /// インタンスを生成する関数
    private let initializer: (() -> Object)

    /// インスタンスの設定をする関数のリスト
    private var configurators = [(Object) -> Void]()

    /// インタンスの生成関数で初期化
    required init(initializer: @escaping (() -> Object)) {
        self.initializer = initializer
    }

    convenience init(_ initializer: @autoclosure @escaping () -> Object) {
        self.init(initializer: initializer)
    }

    /// インスタンスの設定を追加
    @discardableResult
    func add(_ configurator: @escaping (Object) -> Void) -> RawBuilder {
        configurators.append(configurator)
        return self
    }

    /// 設定をもとにインタンスを生成
    func build() -> Object {
        return configurators.reduce(into: initializer()) { $1($0) }
    }
}
