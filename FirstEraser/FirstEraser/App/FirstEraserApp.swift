//
//  FirstEraserApp.swift
//  FirstEraser
//
//  Created by user248068 on 9/8/23.
//

import SwiftUI
import Firebase

@main
struct FirstEraserApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
