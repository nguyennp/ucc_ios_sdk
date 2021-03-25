//
//  UIColor+Extension.swift
//  MobileSCSS
//
//  Created by Ngọc Trung on 2/21/17.
//  Copyright © 2017 VNPT DANANG. All rights reserved.
//

extension UIColor {
    
    convenience init(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    convenience init(hexString: String, alpha: Float) {
        var hex = hexString
        
        if hex.hasPrefix("#") {
            hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 1))
        }
        
        if (hex.range(of: "(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .regularExpression) != nil) {
            
            if hex.count == 3 {
                let redHex   = hex.substring(to: hex.index(hex.startIndex, offsetBy: 1))
                let greenHex = hex.substring(with: hex.index(hex.startIndex, offsetBy: 1) ..< hex.index(hex.startIndex, offsetBy: 2))
                let blueHex  = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
                
                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }
            
            let redHex = hex.substring(to: hex.index(hex.startIndex, offsetBy: 2))
            let greenHex = hex.substring(with: hex.index(hex.startIndex, offsetBy: 2) ..< hex.index(hex.startIndex, offsetBy: 4))
            let blueHex = hex.substring(with: hex.index(hex.startIndex, offsetBy: 4) ..< hex.index(hex.startIndex, offsetBy: 6))
            
            var redInt:   CUnsignedInt = 0
            var greenInt: CUnsignedInt = 0
            var blueInt:  CUnsignedInt = 0
            
            Scanner(string: redHex).scanHexInt32(&redInt)
            Scanner(string: greenHex).scanHexInt32(&greenInt)
            Scanner(string: blueHex).scanHexInt32(&blueInt)
            
            self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        }
        else {
            self.init()
        }
    }
    
    class func colorWithHex(hexString: String?) -> UIColor? {
        return colorWithHex(hexString: hexString, alpha: 1.0)
    }
    
    class func colorWithHex(hexString: String?, alpha: CGFloat) -> UIColor? {
        if let hexString = hexString {
            var count: Int? = nil
            do {
                let regexp = try NSRegularExpression(pattern: "\\A#[0-9a-f]{6}\\z", options: .caseInsensitive)
                count = regexp.numberOfMatches(in: hexString, options: .reportProgress, range: NSMakeRange(0, hexString.count))
            } catch let error as NSError {
                print("ERROR (colorWithHex): \(error)")
            }
            if count != 1 || count == nil {
                return nil
            }
            
            var rgbValue : UInt32 = 0
            
            let scanner = Scanner(string: hexString)
            
            scanner.scanLocation = 1
            scanner.scanHexInt32(&rgbValue)
            
            let red   = CGFloat( (rgbValue & 0xFF0000) >> 16) / 255.0
            let green = CGFloat( (rgbValue & 0xFF00) >> 8) / 255.0
            let blue  = CGFloat( (rgbValue & 0xFF) ) / 255.0
            
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        return nil
    }
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}

//
//  UIColorExtension.swift
//  HEXColor
//
//  Created by R0CKSTAR on 6/13/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

import UIKit

/**
 MissingHashMarkAsPrefix:   "Invalid RGB string, missing '#' as prefix"
 UnableToScanHexValue:      "Scan hex error"
 MismatchedHexStringLength: "Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8"
 */
public enum UIColorInputError : Error {
    case missingHashMarkAsPrefix,
    unableToScanHexValue,
    mismatchedHexStringLength
}

extension UIColor {
    /**
     The shorthand three-digit hexadecimal representation of color.
     #RGB defines to the color #RRGGBB.
     
     - parameter hex3: Three-digit hexadecimal value.
     - parameter alpha: 0.0 - 1.0. The default is 1.0.
     */
    public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The shorthand four-digit hexadecimal representation of color with alpha.
     #RGBA defines to the color #RRGGBBAA.
     
     - parameter hex4: Four-digit hexadecimal value.
     */
    public convenience init(hex4: UInt16) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     
     - parameter hex6: Six-digit hexadecimal value.
     */
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
     
     - parameter hex8: Eight-digit hexadecimal value.
     */
    public convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let alpha     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let red   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let green    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let blue   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, throws error.
     
     - parameter rgba: String value.
     */
    public convenience init(rgba_throws rgba: String) throws {
        guard rgba.hasPrefix("#") else {
            throw UIColorInputError.missingHashMarkAsPrefix
        }
        
        let hexString: String = rgba.substring(from: rgba.index(rgba.startIndex, offsetBy: 1))
        var hexValue:  UInt32 = 0
        
        guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
            throw UIColorInputError.unableToScanHexValue
        }
        
        switch hexString.count {
        case 3:
            self.init(hex3: UInt16(hexValue))
        case 4:
            self.init(hex4: UInt16(hexValue))
        case 6:
            self.init(hex6: hexValue)
        case 8:
            self.init(hex8: hexValue)
        default:
            throw UIColorInputError.mismatchedHexStringLength
        }
    }
    
    /**
     The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, fails to default color.
     
     - parameter rgba: String value.
     */
    public convenience init(_ rgba: String, defaultColor: UIColor = UIColor.clear) {
        guard let color = try? UIColor(rgba_throws: rgba) else {
            self.init(cgColor: defaultColor.cgColor)
            return
        }
        self.init(cgColor: color.cgColor)
    }
    
    /**
     Hex string of a UIColor instance.
     
     - parameter includeAlpha: Whether the alpha should be included.
     */
    public func hexString(_ includeAlpha: Bool = true) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
}

// MARK: COLOR THEME
extension UIColor {
    
    class var theme: UIColor {
        return #colorLiteral(red: 0.2705882353, green: 0.4117647059, blue: 0.5647058824, alpha: 1)
    }
    
    class var navibar: UIColor {
        return #colorLiteral(red: 0, green: 0.631372549, blue: 0.8941176471, alpha: 1)
    }
    
    class var text: UIColor {
        return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    class var success: UIColor {
        return #colorLiteral(red: 0.1215686275, green: 0.6941176471, blue: 0.5411764706, alpha: 1)
    }
    
    class var warning: UIColor {
        return #colorLiteral(red: 1, green: 0.5254901961, blue: 0, alpha: 1)
    }
    
    class var error: UIColor {
        return #colorLiteral(red: 1, green: 0.3568627451, blue: 0.2549019608, alpha: 1)
    }
    
    class var info: UIColor {
        return #colorLiteral(red: 0.2941176471, green: 0.4196078431, blue: 0.4784313725, alpha: 1)
    }
    class var defaultHeaderTableColor: UIColor {
        
        return UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    }
}

//MARK: argb2rgba
extension String {
    /**
     Convert argb string to rgba string.
     */
    public func argb2rgba() -> String? {
        guard self.hasPrefix("#") else {
            return nil
        }
        let hexString = String(self[self.index(self.startIndex, offsetBy: 1)...])
        switch (hexString.count) {
        case 4:
            return "#"
                + hexString[self.index(self.startIndex, offsetBy: 1)...]
                + hexString[..<self.index(self.startIndex, offsetBy: 1)]
        case 8:
            return "#"
                + hexString[self.index(self.startIndex, offsetBy: 2)...]
                + hexString[..<self.index(self.startIndex, offsetBy: 2)]
        default:
            return nil
        }
    }
}
