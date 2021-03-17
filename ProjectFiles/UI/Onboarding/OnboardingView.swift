//
//  OnboardingView.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 16/03/21.
//

import SwiftUI

struct OnboardingView: View {
	
	@State var phoneNo: String = ""
	
	var body: some View {
		parentView
	}
	
}

extension OnboardingView {
	
	private var parentView: some View {
		VStack(spacing: 0) {
			logo
			bottomView
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.primaryColor.ignoresSafeArea())
	}
	
	private var logo: some View {
		Image("onboarding_logo")
			.padding(.vertical, 50)
	}
}

extension OnboardingView {
	
	private var bottomView: some View {
		VStack(spacing: 0) {
			headingView
			inputView
			Spacer()
			button
		}
		.background(
			Color.white
				.cornerRadius(30, corners: [.topLeft, .topRight])
				.ignoresSafeArea()
		)
	}
	
	private var headingView: some View {
		HStack(spacing: 0) {
			VStack(alignment: .leading, spacing: 5) {
				Text("Welcome To hop")
					.font(Font.montserratSemiBold(20))
				Text("Please enter the following details")
					.font(Font.montserratMedium(16))
					.foregroundColor(Color(hex: "9096AA"))
				Text("Enter Phone Number")
					.font(Font.montserratMedium(12))
					.foregroundColor(Color(hex: "9096AA"))
					.padding(.top, 20)
			}
			Spacer()
		}
		.padding(.top, 40)
		.padding(.bottom, 10)
		.padding(.horizontal, 20)
	}
	
	private var button: some View {
		Button(action: {
			
		}, label: {
			Text("Send OTP")
				.foregroundColor(Color.white)
				.font(Font.montserratSemiBold(16))
				.frame(width: UIScreen.screenWidth - 60)
				.padding(.vertical, 15)
				.background(Color.primaryColor)
				.cornerRadius(10)
		})
		.buttonStyle(PlainButtonStyle())
		.padding(.bottom, 20)
	}
	
}

extension OnboardingView {
	
	private var inputView: some View {
		HStack(spacing: 5) {
			isdCodebutton
			phoneNoField
		}
		.padding(.horizontal, 20)
	}
	
	private var isdCodebutton: some View {
		Button(action: {
			
		}, label: {
			HStack(spacing: 5) {
				Text("+91")
					.foregroundColor(Color.black)
					.font(Font.montserratMedium(14))
					.padding(.vertical, 12)
					.padding(.leading, 10)
				Image("dropdown")
					.padding(.horizontal, 10)
			}
			.overlay(
				RoundedRectangle(cornerRadius: 4)
					.stroke(Color.black.opacity(0.2), lineWidth: 1)
			)
		})
		.buttonStyle(PlainButtonStyle())
	}
	
	private var phoneNoField: some View {
		TextField("Phone", text: self.$phoneNo)
			.font(Font.montserratMedium(14))
			.keyboardType(.numberPad)
			.autocapitalization(.none)
			.disableAutocorrection(true)
			.padding(.vertical, 12)
			.padding(.horizontal, 10)
			.overlay(
				RoundedRectangle(cornerRadius: 4)
					.stroke(Color.black.opacity(0.2), lineWidth: 1)
			)
	}
	
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}
