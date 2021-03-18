//
//  OTPView.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 18/03/21.
//

import SwiftUI

struct OTPView: View {
	
	@State var otp: String = ""
	@State var isPushed: Bool = false
		
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
			NavigationLink(
				destination: ProfileView(),
				isActive: self.$isPushed
			) {}
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
			phoneNoView
			inputTitleView
			inputView
			resendView
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
			self.isPushed.toggle()
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
	
	private var phoneNoView: some View {
		HStack(spacing: 0) {
			Text("+91-9090XXXXXX")
				.font(Font.montserratMedium(16))
				.foregroundColor(.black)
			Spacer()
			changeNoButton
		}
		.padding(.horizontal, 20)
	}
	
	private var changeNoButton: some View {
		Button(action: {
			
		}, label: {
			Text("Change Number")
				.foregroundColor(Color.red)
				.font(Font.montserratMedium(12))
				.padding(.vertical, 5)
		})
		.buttonStyle(PlainButtonStyle())
	}
	
	private var inputTitleView: some View {
		HStack {
			Text("Enter OTP")
				.font(Font.montserratMedium(12))
				.foregroundColor(.gray)
			Spacer()
			Text("00:14")
				.font(Font.montserratMedium(12))
				.foregroundColor(.gray)
		}
		.padding(.top, 20)
		.padding(.bottom, 10)
		.padding(.horizontal, 20)
	}
	
	private var inputView: some View {
		HStack {
			ForEach(0..<6) { _ in
				TextField("", text: self.$otp)
					.foregroundColor(Color.primaryColor)
					.font(Font.montserratMedium(18))
					.multilineTextAlignment(.center)
					.padding(.vertical, 15)
					.overlay(
						Rectangle()
							.stroke(Color.black.opacity(0.2), lineWidth: 1)
					)
			}
		}
		.padding(.bottom, 20)
		.padding(.horizontal, 20)
	}
	
	private var resendView: some View {
		HStack(alignment: .center, spacing: 5) {
			Text("Didn't receive your code?")
				.foregroundColor(.gray)
				.font(Font.montserratMedium(14))
			resendButton
		}
	}
	
	private var resendButton: some View {
		Button(action: {
			
		}, label: {
			Text("Resend Now")
				.foregroundColor(Color.primaryColor)
				.font(Font.montserratMedium(14))
				.padding(.vertical, 5)
		})
		.buttonStyle(PlainButtonStyle())
	}
	
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
