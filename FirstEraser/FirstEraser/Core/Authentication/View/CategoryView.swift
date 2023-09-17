//
//  CategoryView.swift
//  FirstEraser
//
//  Created by user248068 on 9/14/23.
//

import SwiftUI

struct CategoryView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                                  GridItem(.flexible())
       ]
    var body: some View {
        NavigationView{
                    ScrollView {
                        LazyVGrid(columns: columns){
                            FrameworkTitleView(name: "Home", imageName: "home")
                            FrameworkTitleView(name: "Home", imageName: "home")
                            FrameworkTitleView(name: "Home", imageName: "home")
                            FrameworkTitleView(name: "Home", imageName: "home")
                        }
                    }
                    .navigationTitle("SignoLingo").font(.subheadline)
                }
            
    }
}

struct MainView: View {
    @State var tabSelection = 0

    var body: some View {
        TabView {
            CategoryView()
                .tabItem {
                    Label("Categorias", systemImage: "folder.fill")
            }
            SwiftUIView()
                .tabItem {
                    Label("Diccionario", systemImage: "book.fill")
                }
            CategoryView()
                .tabItem {
                    Label("Camara", systemImage: "camera.fill")
                }
        }.padding(.horizontal, 8)
         .padding(.top, 14)
         .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 34, style: .continuous))
         .background(
            Circle()
         )
         .ignoresSafeArea()

    }
}

struct FrameworkTitleView: View{
    let name: String
    let imageName: String
    
    var body: some View {
    
    Grid {
        //RoundedRectangle(cornerRadius: 30)
       //     .foregroundColor(Color.black.opacity(0.1))
            
        Image(imageName)
            .resizable()
            .frame(width: 90, height: 90)
            .cornerRadius(25)
        Spacer()
        Spacer()
        Text(name)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .scaledToFit()
        }
        
        
    .padding()
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
