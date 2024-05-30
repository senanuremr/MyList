//
//  ProfileView.swift
//  My List
//
//  Created by Senanur EMİR on 8.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.accent))
                            .clipShape(Circle())
                        
                        VStack{
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)                    }
                    }
                }
                Section("General"){
                    HStack{
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account"){
                    Button{
                        viewModel.signOut()
                    } label:{
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Çıkış Yap",
                                        tintColor: .accentColor)
                    }
                }
            }.listStyle(PlainListStyle()) 
            .background(Color.white)
            .listRowBackground(Color.white)
        }
    }
        
}
struct ProfileView_Previews: PreviewProvider{
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())

    }
}
