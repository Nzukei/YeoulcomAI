//
//  InputView.swift
//  YeoulcomAI
//
//  Created by 신도형 on 2022/11/06.
//

import SwiftUI

struct InputView: View {
    
    @State var name: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("텍스트를 입력해주세요", text: $name)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                
                Button {
                } label: {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("보내기")
                    }
                }
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
