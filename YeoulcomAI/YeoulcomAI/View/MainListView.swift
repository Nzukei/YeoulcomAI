//
//  MainListView.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import SwiftUI

struct MainListView: View {
    
    @State private var showWiki = false
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Section {
                        NavigationLink {
                            ZStack {
                                MyWebView(urlToLoad: "https://04abd68b9234df0e.gradio.app/")
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
                    }
                    
                    Section {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 3) {
                                Text("AI가 만든 이미지들")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                
                                ScrollView(.horizontal, showsIndicators: false, content: {
                                    HStack {
                                        ForEach(1..<9) {
                                            Image("sample\($0)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 300, height: 300)
                                                .shadow(color: .black, radius: 5)
                                                .cornerRadius(6)
                                        }
                                    }
                                })
                            }
                        }
                    }
                    
                    Section {
                        ZStack(alignment:.center) {
                            Text("AI의 무궁무진한 발전")                                .opacity(0.4)
                                .padding()
                            
                            NavigationLink {
                                Button {
                                    showWiki = true
                                } label: {
                                    MyWebView(urlToLoad: "https://namu.wiki/w/Stable%20Diffusion")
                                }
                            } label: {
                                LottieView(jsonName: "IPA")
                                    .frame(width: 10000 , height: 100)
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
