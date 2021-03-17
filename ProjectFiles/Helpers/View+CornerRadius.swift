//
//  View+CornerRadius.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 17/03/21.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
	
	var radius: CGFloat
	var corners: UIRectCorner
	
	struct CornerRadiusShape: Shape {
		
		var radius = CGFloat.infinity
		var corners = UIRectCorner.allCorners
		
		func path(in rect: CGRect) -> Path {
			let path = UIBezierPath(
				roundedRect: rect,
				byRoundingCorners: self.corners,
				cornerRadii: CGSize(
					width: self.radius,
					height: self.radius
				)
			)
			return Path(path.cgPath)
		}
	}
	
	func body(content: Content) -> some View {
		content
			.clipShape(
				CornerRadiusShape(
					radius: self.radius,
					corners: self.corners
				)
			)
	}
	
}

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		ModifiedContent(
			content: self,
			modifier: CornerRadiusStyle(radius: radius, corners: corners)
		)
	}
}
