//
//  StarterView.swift
//  FirstEraser
//
//  Created by user248068 on 9/14/23.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct StarterView: View {
    var body: some View {
        
        NavigationView {
            ZStack{
                
                Text("Signo Lingo")
                    .fontWeight(.heavy)
                     
                 
                HStack() {
                     
                    NavigationLink(destination: RegistrationView()) {
                        
                        Text("Registrate")
                    }
                    .buttonStyle(GrowingButton())
                    Spacer()
                    NavigationLink(destination: LogInView()) {
                        Text("Ingresa")
                    }
                    .buttonStyle(GrowingButton())
                    }

            }
            
        }
        }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
