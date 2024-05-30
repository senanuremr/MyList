//
//  RegisterView.swift
//  My List
//
//  Created by Senanur EMİR on 27.04.2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
                VStack{
                    Image("ListAppLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .padding(.vertical, 32)
                    
                    //form field
                    VStack(spacing:24){
                        
                        InputView(text: $email,
                                  title: "Email Adresiniz",
                                  placeholder: "isim@model.com")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        
                        InputView(text: $fullname,
                                  title: "Adınız ve Soyadınız",
                                  placeholder: "Adınızı ve Soyadınızı Giriniz")
                        
                        InputView(
                            text: $password,
                            title: "Şifreniz",
                            placeholder: "Şifrenizi Giriniz",
                            isSecureField: true )
                        
                        ZStack(alignment:.trailing){
                            InputView(
                                text: $confirmPassword,
                                title: "Parolanızı Doğrulama",
                                placeholder: "Parolanızı Doğrulayın",
                                isSecureField: true )
                            
                            if !password.isEmpty && !confirmPassword.isEmpty{
                                if password == confirmPassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
            
                    
                    Button{
                        Task{
                            try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                        }
                    } label: {
                        HStack{
                            Text("KAYIT OL")
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
                    
                    // sign up button
                    
                    NavigationLink{
                        LoginView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 3) {
                            Text("Hesabınız var mı ?")
                            Text("Giriş Yapın")
                        }.fontWeight(.bold)
                    }.font(.system(size: 14))
                    
                }
            }
}

// MARK: - AuthenticationFormProtocol

extension RegisterView: AuthenticationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
    }
}
    struct RegisterView_Previews: PreviewProvider{
        static var previews: some View {
            RegisterView()
        }
    }
