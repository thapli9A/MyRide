//
//  TutorialView.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 16/03/21.
//

import SwiftUI

struct TutorialView: View {
	
	@State var currentPage: Int = 0
	private var images: [String] = [
		"tutorial_img_1",
		"tutorial_img_2",
		"tutorial_img_3",
		"tutorial_img_4"
	]
	
	var body: some View {
		parentView
	}
	private var parentView: some View {
		ZStack {
			bgImage
			bgView
		}
	}
	private var bgImage: some View {
		Image(self.images[self.currentPage])
			.resizable()
			.frame(maxHeight: .infinity)
			.background(Color.red)
			.ignoresSafeArea()
	}
	private var bgView: some View {
		GeometryReader { proxy in
			VStack(spacing: 0) {
				skipView
				Spacer()
				bottomView(proxy: proxy)
			}
		}
	}
}

// MARK: Top View
extension TutorialView {
	
	private var skipView: some View {
		HStack {
			Spacer()
			skipButton
			Spacer().frame(width: 20)
		}
	}
	
	private var skipButton: some View {
		Button(action: {
			
		}, label: {
			let color: Color = self.currentPage == 3 ? .white : .black
			Text("Skip")
				.font(Font.montserratSemiBold(16))
				.foregroundColor(color)
				.padding(.all, 15)
		})
		.buttonStyle(PlainButtonStyle())
	}
	
}

// MARK: Bottom View
extension TutorialView {
	
	private func bottomView(proxy: GeometryProxy) -> some View {
		VStack {
			pageControl
			textViews
			Spacer()
			button(proxy: proxy)
		}
		.frame(
			width: proxy.size.width - 40,
			height: proxy.size.height / 2.2
		)
		.background(Color.white)
		.cornerRadius(8)
		.padding(.horizontal, 20)
	}
	
	private var pageControl: some View {
		PageControl(
			numberOfPages: 4,
			defaultColor: "E6EBF0",
			highlightColor: "008EFF",
			currentPage: self.$currentPage
		)
		.padding(.vertical, 30)
	}
	
	private var textViews: some View {
		Group {
			Text("Hop to future")
				.font(Font.montserratSemiBold(18))
				.multilineTextAlignment(.center)
				.padding(.bottom, 10)
			Text("Hop electric Scooters make getting\n around easier and way more fun!")
				.font(Font.montserratMedium(16))
				.foregroundColor(Color(hex: "9096AA"))
				.multilineTextAlignment(.center)
		}
	}
	
	private func button(proxy: GeometryProxy) -> some View {
		Button(action: {
			if self.currentPage < 3 {
				self.currentPage += 1
			} else {
				sceneDelegate.showOnboarding()
			}
		}, label: {
			Text("Get Started")
				.font(Font.montserratMedium(16))
				.foregroundColor(Color.white)
				.frame(
					width: proxy.size.width - 80,
					height: 50
				)
				.background(Color(hex: "0F204D"))
				.cornerRadius(10)
		})
		.buttonStyle(PlainButtonStyle())
		.padding(.bottom, 40)
	}
	
}

struct TutorialView_Previews: PreviewProvider {
	static var previews: some View {
		TutorialView()
	}
}
