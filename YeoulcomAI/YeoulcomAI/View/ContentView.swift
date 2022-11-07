//
//  ContentView.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isContentReady: Bool = false
    
    var body: some View {
        ZStack {
            MainListView()
            
            if !isContentReady {
                LottieView()
                    .transition(.opacity)
                    .background(Color.white.edgesIgnoringSafeArea(.all))
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                withAnimation{isContentReady.toggle()}
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
