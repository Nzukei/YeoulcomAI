//
//  MainListView.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import SwiftUI

struct MainListView: View {
    
    @State var isContentReady: Bool = false
    @State private var showWiki = false
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section {
                        NavigationLink {
                            ZStack {
                                MyWebView(urlToLoad: "https://02f98a5530432c17.gradio.app/")
                            }
                        } label: {
                            HStack {
                                Image(systemName: "arrow.up.and.person.rectangle.portrait")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(.all, 10)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("AI모델 사용하기")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                    
                                    Text("텍스트를 입력하여 원하는 이미지 받기")
                                        .font(.system(size: 14))
                                }
                            }
                        }
                        
                        HStack {
                            NavigationLink {
                                MyWebView(urlToLoad: "http://192.168.219.100:8501/")
                            } label: {
                                Image(systemName: "text.word.spacing")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(.all, 10)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("문장 만들기")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                    
                                    Text("단어를 선택해 문장 만들어보기")
                                        .font(.system(size: 14))
                                }
                            }
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                                    withAnimation{isContentReady.toggle()}
                                })
                            }
                        }
                        
                        HStack {
                            NavigationLink {
                                
                            } label: {
                                Image(systemName: "figure.walk")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .padding(.all, 10)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("행동 인식하기")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                    
                                    Text("카메라 앞에서 행동 인식하기")
                                        .font(.system(size: 14))
                                }
                            }
                        }
                    }
                    
                    Section {
                        ZStack(alignment:.center) {
                            Text("AI의 무궁무진한 발전")
                                .opacity(0.4)
                                .padding()
                            
                            NavigationLink {
                                AutoScrolling()
                            } label: {
                                HStack {
                                    Spacer(minLength: 20)
                                    LottieView(jsonName: "IPA")
                                        .frame(width: 10000 , height: 100)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Yeoulcom AI")
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
    }
}
