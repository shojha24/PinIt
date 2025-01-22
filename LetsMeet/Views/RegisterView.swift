//
//  RegisterView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = RegisterVM()
    
    @State var xPos: CGFloat = -100
        
        var body: some View {
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
                        Text("Make an **Account**")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .foregroundColor(.white)

                        
                        Text("Would be kinda hard to use the app otherwise lol.")
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
                                TextField("Name", text: $viewModel.name)
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
                        
                        Button(action: {viewModel.register()}) {
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
                            Text("Sign up with Google")
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
                    }
                    .ignoresSafeArea(.keyboard, edges: .bottom)
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

#Preview {
    RegisterView()
}
