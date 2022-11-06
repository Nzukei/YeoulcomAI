//
//  YeoulcomAIApp.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/04.
//

import SwiftUI

@main
struct YeoulcomAIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
