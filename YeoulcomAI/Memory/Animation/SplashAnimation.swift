//
//  SplashAnimation.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import Foundation
import SwiftUI
import UIKit
import Lottie


/// 로티 애니메이션 뷰
struct LottieView: UIViewRepresentable {
    
    var name : String
    var loopMode: LottieLoopMode

    init(jsonName: String = "YeoulcomAI",
         _ loopMode : LottieLoopMode = .loop){
        print("LottieView - init() called / jsonName: ", jsonName)
        self.name = jsonName
        self.loopMode = loopMode
    }
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        print("LottieView - makeUIView() called")
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView()
        let animation = Animation.named(name)
        
        animationView.animation = animation
        
        animationView.contentMode = .scaleAspectFit
        
        animationView.loopMode = loopMode
        
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        animationView.backgroundBehavior = .pauseAndRestore
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("LottieView - updateUIView() called")
    }
}
