//
//  LoginView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = LoginVM()
    
    @State var xPos: CGFloat = -100
        
        var body: some View {
            NavigationView {
                    ZStack {
                        // Background color
                        Color(Color.letsOrange)
                            .ignoresSafeArea()
                        
                        Image("wordssvg")
                            .scaleEffect(0.5)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                            .opacity(0.15)
                            .offset(x: xPos)
                            .onAppear() {
                                withAnimation(Animation.easeInOut(duration: 20).repeatForever(autoreverses: true)) {
                                    xPos += 200
                                }
                            }
                        
                        
                        VStack(spacing: 16) {
                            // Title Section
                            VStack(spacing: 8) {
                                Text("Login to **PinIt**")
                                    .font(.largeTitle)
                                    .fontWeight(.light)
                                    .foregroundColor(.white)
                                
                                Text("We're putting fun **on the map**.")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 24)
                            
                            // Login Form
                            VStack(spacing: 16) {
                                // Form fields and buttons
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white.opacity(0.2))
                                    .frame(height: 20)
                                    .overlay(
                                        TextField("Email", text: $viewModel.email)
                                            .autocorrectionDisabled()
                                            .autocapitalization(.none)
                                            .padding(.horizontal)
                                    )
                                
                                Divider()
                                    .overlay(.gray)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white.opacity(0.2))
                                    .frame(height: 20)
                                    .overlay(
                                        SecureField("Password", text: $viewModel.pwd)
                                            .autocorrectionDisabled()
                                            .autocapitalization(.none)
                                            .padding(.horizontal)
                                    )
                                
                                Divider()
                                    .overlay(.gray)
                                
                                if !viewModel.errorMessage.isEmpty {
                                    Text(viewModel.errorMessage)
                                        .foregroundColor(.red)
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Button(action: {viewModel.login()}) {
                                    Text("Let's Go!")
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.letsOrange)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.letsOrange, lineWidth: 3)
                                        )
                                }
                                
                                Text("Or:")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                                
                                Button(action: {}) {
                                    Text("Log in with Google")
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.white)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.blue, lineWidth: 3)
                                        )
                                }
                                
                                Divider()
                                    .frame(height: 2)
                                    .overlay(.gray.opacity(0.4))
                                    .padding(.top, 20)
                                
                                Text("Don't have an account?")
                                    .foregroundColor(.black.opacity(0.5))
                                    .font(.footnote)
                                
                                Button(action: {}) {
                                    NavigationLink("Sign Up", destination: RegisterView())
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.white)
                                        .foregroundColor(Color.letsOrange)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(Color.letsOrange), lineWidth: 3)
                                        )
                                }
                                
                                Text("Made by Sharabh Ojha")
                                    .foregroundColor(.black.opacity(0.2))
                                    .font(.system(size: 9))
                            }
                            .ignoresSafeArea(.keyboard)
                            .padding(24)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white)
                            )
                            .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                        .padding()
                    }
            }
        }
}

#Preview {
    LoginView()
}
