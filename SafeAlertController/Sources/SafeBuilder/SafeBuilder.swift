//
//  SafeBuilder.swift
//  Alert
//
//  Created by Takehito Koshimizu on 2018/07/22.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

// MARK: -
/// SafeBuilder
public struct SafeBuilder<Object: AnyObject, State> {
    private let builder: RawBuilder<Object>
}

// MARK: -
/// SafeBuilder
extension SafeBuilder {

    init(_ initializer: @autoclosure @escaping () -> Object) {
        self.init(builder: RawBuilder(initializer: initializer))
    }

    func append<T>(_ configurator: @escaping (Object) -> Void) -> SafeBuilder<Object, T> {
        builder.add(configurator)
        return unsafeBitCast(builder, to: SafeBuilder<Object, T>.self)
    }

    func build() -> Object {
        return builder.build()
    }
}
