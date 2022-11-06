//
//  WebViewModel.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import Foundation
import Combine

class WebViewModel: ObservableObject {
    var foo = PassthroughSubject<Bool, Never>()
    var bar = PassthroughSubject<Bool, Never>()
}
