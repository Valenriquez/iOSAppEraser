//
//  RegistrationView.swift
//  FirstEraser
//
//  Created by user248068 on 9/11/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Image("user")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 120)
                .padding(.vertical, 35)
            
            VStack(spacing: 24){
                InputView(text: $email,
                          title: "Correo electronico",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                
                InputView(text: $fullname,
                          title: "Nombre Completo",
                          placeholder: "Ingresa tu nombre completo")
                
                
                InputView(text: $password,
                          title: "Contrasenia",
                          placeholder: "Ingresa tu contrasenia",
                          isSecureField: true)
 
                
                ZStack(alignment: .trailing){
                    InputView(text: $confirmPassword,
                                 title: "Repite tu Contrasenia",
                                 placeholder: "Ingresa de nuevo tu contrasenia",
                                 isSecureField: true)
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                    password: password,
                                                    fullname: fullname)
                }
            } label: {
                HStack {
                    Text("Enrolate")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 20)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Ya tienes una cuenta ?")
                    Text("Ingresa")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}


extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullname.isEmpty
        
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
