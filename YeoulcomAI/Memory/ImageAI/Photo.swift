//
//  Photo.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import Foundation
import SwiftUI

class Photo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    
    init(content: String) {
        id = UUID()
        self.content = content
    }
}
