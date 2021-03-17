//
//  UIColor+Helper.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 16/03/21.
//

import Foundation
import SwiftUI

extension Color {
	
	init(hex: String) {
		let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hex).scanHexInt64(&int)
		let a, r, g, b: UInt64
		switch hex.count {
		case 3: // RGB (12-bit)
			(a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB (24-bit)
			(a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
		case 8: // ARGB (32-bit)
			(a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
		default:
			(a, r, g, b) = (1, 1, 1, 0)
		}

		self.init(
			.sRGB,
			red: Double(r) / 255,
			green: Double(g) / 255,
			blue:  Double(b) / 255,
			opacity: Double(a) / 255
		)
	}
	
}

public extension UIColor {
	
	convenience init(red: Int, green: Int, blue: Int, opacity: CGFloat = 1.0) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
	}
	
	convenience init(hex: Int, alpha: CGFloat = 1.0) {
		self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, opacity:alpha)
	}
	
	convenience init(hexString: String) {
		var hexValue: CUnsignedLongLong = 0
		let scanner = Scanner(string: hexString)
		scanner.scanHexInt64(&hexValue)
		let value = Int(hexValue)
		self.init(red:(value >> 16) & 0xff, green:(value >> 8) & 0xff, blue:value & 0xff)
	}
	
}
