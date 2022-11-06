//
//  ImageStore.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import Foundation

class ImageStore: ObservableObject {
    @Published var list: [Photo]
    
    init() {
        list = ["sample1", "sample2", "sample3", "sample4", "sample5", "sample6", "sample7", "sample8"]
    }
    
    func insert(photo: String) {
        list.insert(Photo(content: photo), at: 0)
    }
}
