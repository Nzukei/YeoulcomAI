//
//  AutoScrolling.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/07.
//

import SwiftUI

struct AutoScrolling: View {
    private var numberOfImages = 9
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State var isContentReady: Bool = false
    
    func next() {
        withAnimation {
            currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    if !isContentReady {
                        LottieView()
                            .transition(.opacity)
                            .background(Color.white.edgesIgnoringSafeArea(.all))
                    }
                    Text("앱에서 사용된 AI모델")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                    TabView(selection: $currentIndex) {
                        ForEach(1..<numberOfImages, id: \.self) { num in
                            Image("sample\(num)")
                                .resizable()
                                .scaledToFill()
                                .overlay(Color.black.opacity(0.1))
                                .tag(num)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                    .frame(width: proxy.size.width, height: proxy.size.height / 3)
                    .onReceive(timer, perform: { _ in
                        withAnimation {
                            next()
                        }
                    })
                    
                    Text("Stable Diffusion - 그림 합성 AI")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                    ScrollView {
                        Section {
                            HStack {
                                Text("""
                1) 비싼 리소스를 들여 학습한 모델과 코드 뿐 아니라
                사용한 데이터를 모으는 방법 등을 모두 공개한
                오픈소스입니다. 따라서 누구나 사용이 가능하며, 이를
                기반으로 다양한 연구나 서비스 개발을 할 수 있도록
                구성되어있습니다.
                
                2) 일반 GPU 1장으로도 충분히 inference할 수 있을
                정도로, 효율적이며 성능이 꽤 잘 나오는 모델입니다.

                3) Diffusion Model은 training dataset과 비슷한
                데이터를 생성하는 방법입니다. 학습 과정에서 training
                data에 지속적으로 노이즈를 추가해서 데이터를
                망가뜨리는데, 이걸 원상복구하는 과정을 학습하게
                됩니다.

                4) 뿐만 아니라 Diffusion model을 사용하기 위해
                UNet Architecture를 그대로 사용한다. 따라서 text
                encoding 값을 condition으로 주도록하여 사용자가
                텍스트로 입력한 내용을 바탕으로 결과가
                나오도록 한다.
            """)
                            }
                        }
                    }
                }
            }
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                withAnimation{isContentReady.toggle()}
            })
        }
    }
}

struct AutoScrolling_Previews: PreviewProvider {
    static var previews: some View {
        AutoScrolling()
    }
}
