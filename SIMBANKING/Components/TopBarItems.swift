//
//  SwiftUIView.swift
//  SIMBANKING
//
//  Created by Gemini Child on 01/04/2024.
//

import SwiftUI

struct TopBarItems: View {
    var body: some View {
        HStack{
            Circle()
                .fill(.whiteGray)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading){
                Text("Good afternoon,")
                Text("Gemini")
            }
            .foregroundStyle(.gray)
            .font(.caption)
                
            Spacer()
            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                Circle()
                    .stroke(.border,lineWidth: 5)
                    .fill(.back.gradient.shadow(.inner(color: .whiteMade.opacity(0.5),radius: 10, x: 20,y: 10)))
                    .frame(width: 45, height: 45)
                    .shadow(color: .dark.opacity(0.05), radius: 5)
                Image(systemName: "ellipsis.message")
                    .foregroundStyle(.cGreen)
            }
        }
        .background(.back)
    }
}

#Preview {
    TopBarItems()
}
