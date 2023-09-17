//
//  ContentView.swift
//  FirstEraser
//
//  Created by user248068 on 9/8/23.
//

import SwiftUI

struct ContentView: View{
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            }else{
                StarterView()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

