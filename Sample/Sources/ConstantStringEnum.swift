//
//  ConstantStringEnum.swift
//  Sample
//
//  Created by Takehito Koshimizu on 2018/07/28.
//  Copyright © 2018年 Takehito Koshimizu. All rights reserved.
//

enum ConstantStringEnum: String, CustomStringConvertible {

    case title
    case message
    case `default`
    case cancel

    var description: String { return rawValue }
}
