//
//  ContentView.swift
//  StrangeWords
//
//  Created by 马英伦 on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
           HStack
           {
               NavigationLink(destination: ArticleView(message: "Detail Page #2") )
               {
                   Text("Go detail Page #2 >")
               }
               .navigationBarTitle("Index Page #1")
           }
       }
        .padding(.all, 1.0)
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
