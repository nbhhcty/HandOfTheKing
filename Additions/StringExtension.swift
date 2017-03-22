//
//  StringExtension.swift
//  HandOfTheKing
//
//  Created by Carl on 22/3/2017.
//  Copyright © 2017 nswebfrog. All rights reserved.
//

import Foundation


extension String: NamespaceWrappable { }
extension TypeWrapperProtocol where WrappedType == String {
    public func match(regex: String) -> Bool {
        let pred = NSPredicate(format: "SELF MATCHES %@", argumentArray:[regex])
        return pred.evaluate(with: wrappedValue)
    }

    public func index(by: Int) -> String.Index {
        return wrappedValue.index(wrappedValue.startIndex, offsetBy: by)
    }

    public func substring(from: Int) -> String {
        return wrappedValue.substring(from: index(by: from))
    }

    public func substring(to: Int) -> String {
        return wrappedValue.substring(to: index(by: to))
    }

    public func substring(with: Range<Int>) -> String {
        let startIndex = index(by: with.lowerBound)
        let endIndex = index(by: with.upperBound)
        return wrappedValue.substring(with: startIndex..<endIndex)
    }
}