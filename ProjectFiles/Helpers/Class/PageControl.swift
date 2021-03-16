//
//  PageControl.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 16/03/21.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
	
	var numberOfPages: Int
	var defaultColor: String
	var highlightColor: String
	@Binding var currentPage: Int
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}

	func makeUIView(context: Context) -> UIPageControl {
		let control = UIPageControl()
		control.numberOfPages = self.numberOfPages
		control.pageIndicatorTintColor = UIColor(hexString: self.defaultColor)
		control.currentPageIndicatorTintColor = UIColor(hexString: self.highlightColor)
		control.addTarget(
			context.coordinator,
			action: #selector(Coordinator.updateCurrentPage(sender:)),
			for: .valueChanged
		)
		return control
	}

	func updateUIView(_ uiView: UIPageControl, context: Context) {
		uiView.currentPage = self.currentPage
	}

	class Coordinator: NSObject {
		var control: PageControl

		init(_ control: PageControl) {
			self.control = control
		}
		@objc
		func updateCurrentPage(sender: UIPageControl) {
			self.control.currentPage = sender.currentPage
		}
	}
}
