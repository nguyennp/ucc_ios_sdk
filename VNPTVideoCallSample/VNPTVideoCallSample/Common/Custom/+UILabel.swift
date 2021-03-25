//
//  +UILabel.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import Foundation
import UIKit

extension UILabel {
    func halfText(changeText: String, font: UIFont? = nil, color: UIColor? = nil, location: Int = 0) {
        guard let text = self.text else {
            return
        }
        let fullText = text as String
        let ranges = fullText.ranges(of: changeText)
        if ranges.isEmpty {
            return
        }
        let loc = ranges.count > location ? location : 0
        let range = NSRange(fullText.ranges(of: changeText)[loc], in: fullText)
        let c: UIColor = color ?? self.textColor
        let f: UIFont = font ?? self.font
        var attribute = NSMutableAttributedString.init(string: self.text ?? "")
        if self.attributedText != nil {
            attribute = NSMutableAttributedString.init(attributedString: self.attributedText!)
        }
        attribute.addAttribute(NSAttributedString.Key.font, value: f , range: range)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: c , range: range)
        self.attributedText = attribute
    }
}

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        var indices: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                indices.append(range.lowerBound)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return indices
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
