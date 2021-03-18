//
//  PhoneNoView.swift
//  MyRide
//
//  Created by Abhishek Thapliyal on 16/03/21.
//

import SwiftUI

struct PhoneNoView: View {
	
	@State var isdCode: String = "XX"
	@State var phoneNo: String = ""
	@State var showList: Bool = false
	@State var isPushed: Bool = false
	@State var isClearButtonEnabled: Bool = false
	
	private var isdCodes: [String] = String.codeList
	
	var body: some View {
		NavigationView {
			parentView
				.navigationBarHidden(true)
		}
		// to avoid extra padding coming via navigation view
		.navigationViewStyle(StackNavigationViewStyle())
	}
	
}

extension PhoneNoView {
	
	private var parentView: some View {
		VStack(spacing: 0) {
			logo
			bottomView
			NavigationLink(
				destination: OTPView(),
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

extension PhoneNoView {
	
	private var bottomView: some View {
		VStack(spacing: 0) {
			headingView
			inputView
			Spacer()
			otpButton
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
	
	private var otpButton: some View {
		Button(action: {
			self.isPushed.toggle()
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

extension PhoneNoView {
	
	private var inputView: some View {
		ZStack {
			VStack(alignment: .leading, spacing: 0) {
				HStack(alignment: .top, spacing: 10) {
					isdCodebutton
					phoneNoView
				}
				.padding(.horizontal, 20)
				if self.showList {
					listView
						.padding(.leading, 20)
				}
			}
		}
	}
	
	private var phoneNoView: some View {
		HStack(spacing: 0) {
			phoneNoField
			clearbutton
		}
		.overlay(
			RoundedRectangle(cornerRadius: 4)
				.stroke(Color.black.opacity(0.2), lineWidth: 1)
		)
	}
	
	private var phoneNoField: some View {
		TextField("Phone", text: self.$phoneNo)
			.font(Font.montserratMedium(14))
			.keyboardType(.numberPad)
			.autocapitalization(.none)
			.disableAutocorrection(true)
			.padding(.vertical, 12)
			.padding(.horizontal, 10)
			.onChange(of: self.phoneNo, perform: { text in
				self.isClearButtonEnabled = !text.isEmpty
			})
	}
	
	private var clearbutton: some View {
		Button(action: {
			self.phoneNo = ""
		}, label: {
			Text("Clear")
				.foregroundColor(self.isClearButtonEnabled ? .black : .gray)
				.font(Font.montserratMedium(12))
				.padding(.vertical, 12)
				.padding(.horizontal, 15)
		})
		.buttonStyle(PlainButtonStyle())
		.disabled(!self.isClearButtonEnabled)
	}
	
	private var isdCodebutton: some View {
		Button(action: {
			self.showList.toggle()
		}, label: {
			HStack(spacing: 5) {
				Text(self.isdCode)
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
	
	private var listView: some View {
		List {
			ForEach(isdCodes) { item in
				listItem(item: item)
			}
		}
		.frame(width: 70, height: 132)
		.overlay(
			Rectangle()
				.stroke(Color.black.opacity(0.2), lineWidth: 1)
		)
		// to avoid extra padding coming via navigation view but it takes back separator
//		.listStyle(PlainListStyle())
	}
	
	private func listItem(item: String) -> some View {
		VStack(spacing: 0) {
			Button(action: {
				self.isdCode = item
				self.showList.toggle()
			}, label: {
				Text(item)
					.foregroundColor(Color.black)
					.font(Font.montserratMedium(12))
					.frame(maxWidth: .infinity, maxHeight: .infinity)
			})
			.buttonStyle(PlainButtonStyle())
			Color.black.opacity(0.2)
				.frame(maxWidth: .infinity, maxHeight: 1)
		}
		.listRowInsets(EdgeInsets())
	}
	
}

struct PhoneNoView_Previews: PreviewProvider {
	static var previews: some View {
		PhoneNoView()
	}
}
