//
//  ProfileView.swift
//  FirstEraser
//
//  Created by user248068 on 9/11/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                        
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack{
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("Cuenta") {
                    Button{
                        viewModel.signOut()
                    }label:{
                        SettingsRowView(imageName: "arrow.left.circle.fill",                title: "Salte",
                                        tintColor: .red)
                    }
                    
                    Button{
                        print("Delete account...")
                    }label:{
                        SettingsRowView(imageName: "xmark.circle.fill",                title: "Elimina tu cuenta",
                                        tintColor: .red)
                    }
                }
            }

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
