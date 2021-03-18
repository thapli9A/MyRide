//
//  OTPView.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 18/03/21.
//

import SwiftUI

struct OTPView: View {
	
	@State var otp: String = ""
		
	var body: some View {
		parentView
			.navigationBarHidden(true)
	}
	
}

extension OTPView {
	
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

extension OTPView {
	
	private var bottomView: some View {
		VStack(spacing: 0) {
			headingView
			inputView
			Spacer()
			otpButton
			Spacer()
				.frame(height: 20)
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
				Text("Please enter the OTP")
					.font(Font.montserratMedium(16))
					.foregroundColor(Color(hex: "9096AA"))
				Text("Sent to")
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
	
	private var otpButton: some View {
		Button(action: {
			
		}, label: {
			Text("Verify")
				.foregroundColor(Color.white)
				.font(Font.montserratSemiBold(16))
				.frame(width: UIScreen.screenWidth - 60)
				.padding(.vertical, 15)
				.background(Color.primaryColor)
				.cornerRadius(10)
		})
		.buttonStyle(PlainButtonStyle())
	}
	
}

extension OTPView {
	
	private var inputView: some View {
		VStack {
			
		}
	}
	
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
