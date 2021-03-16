//
//  Font+Helper.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 16/03/21.
//

import UIKit
import SwiftUI

extension UIFont {

	class func montserratRegular(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Regular", size: size)!
	}
	
	class func montserratMedium(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Medium", size: size)!
	}
	
	class func montserratLight(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-Light", size: size)!
	}
	
	class func montserratSemiBold(_ size: CGFloat) -> UIFont {
		return UIFont(name: "Montserrat-SemiBold", size: size)!
	}
}

extension Font {

	static func montserratRegular(_ size: CGFloat) -> Self {
		return .custom("Montserrat-Regular", size: size)!
	}
	
	static func montserratMedium(_ size: CGFloat) -> Self {
		return .custom("Montserrat-Medium", size: size)!
	}
	
	static func montserratLight(_ size: CGFloat) -> Self {
		return .custom("Montserrat-Light", size: size)!
	}
	
	static func montserratSemiBold(_ size: CGFloat) -> Self {
		return .custom("Montserrat-SemiBold", size: size)!
	}
}
