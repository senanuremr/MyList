//
//  LoginView.swift
//  My List
//
//  Created by Senanur EMİR on 27.04.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "" 
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            VStack{
                Image("ListAppLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 32)
            
                VStack(spacing:24){
                    
                    InputView(text: $email,
                              title: "Email Adresiniz",
                              placeholder: "isim@hotmail.com")
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    InputView(
                    text: $password,
                    title: "Şifreniz",
                    placeholder: "Şifrenizi Giriniz",
                    isSecureField: true )
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                Button {
                    Task {
                        do {
                            try await viewModel.signIn(withEmail: email, password: password)
                        } catch {
                            print("Sign in error: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    HStack{
                        Text("GİRİŞ YAP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                }
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                //sign up button
                
                NavigationLink{
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3) {
                        Text("Hesabınız yok mu ?")
                        Text("Kayıt Olun")
                            .fontWeight(.bold)
                        
                    }
                }
                .font(.system(size: 14))
                
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider{
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())

    }
}
