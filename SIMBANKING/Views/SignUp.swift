//
//  SignUp.swift
//  SIMBANKING
//
//  Created by Gemini Child on 01/04/2024.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        VStack{
            TopBarItems()
            InputsView()
            Spacer()
            BottomTab(bottonView: customerBottomView)
        }
        .padding()
        .background(.back)
    }
}

#Preview {
    SignUp()
}
struct InputsView: View {
    @State private var password: String = "-1"
    var body: some View {
        VStack{
//            Text("\(password)")
            Text("Enter SimBanking PIN")
                .fontWeight(.light)
                .font(.footnote)
            
            HStack {
                ForEach(0 ..< 4, id: \.self){index in
                    Circle()
                        .fill(Int(password)! >= 0 && String(password).count > index ? .cGreen: .whiteGray)
                        .frame(width: 20)
                        .padding(.horizontal, 24/6)
                        .shadow(color:Int(password)! >= 0 && String(password).count > index ? .cGreen:.gray.opacity(0.2),radius: 4,y: -2)
                }
            }
            .padding()
//            Spacer();
            VStack{
                ForEach(0 ..< 3, id: \.self){indexone in
                    HStack{
                        ForEach(0 ..< 3, id: \.self){index in
                            InputButton(password: $password, indexone: indexone, index: index)
                        }
                    }
                    .padding(.vertical, 12)
                }
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 50){
                    Text("Forgot PIN?")
                        .font(.caption2)
                        .padding(.leading, 24)
                    InputButton(password: $password, indexone: 0, index: -1)
                        .padding(.leading, -40)
                    
                    if let intValue = Int(password), intValue >= 0 {
                        withAnimation(.easeInOut) {
                            Image(systemName: "arrow.left")
                                .padding(.trailing, 12*2)
                                .onTapGesture {
                                    if password.count > 1 {
                                        password.removeLast()
                                    } else {
                                        password = "-1"
                                    }
                                }
                        }
                    }
                    else {
                        withAnimation(.easeInOut) {
                            Text("").padding(.trailing, 20*2)
                        }
                    }
                    
                }
//                .padding(.horizontal, 24)
            }
        }
        .padding(.top)
        .padding(.bottom, -20)
        .foregroundStyle(.dark)
    }
}
struct InputButton: View {
    @Binding var password: String
    let indexone: Int
    let index: Int
    
    var body: some View {
        ZStack{
            Circle()
                .fill(.whiteMade)
                .frame(width: 63, height: 63)
                .padding(.horizontal, 16)
//                                .shadow(color:.gray.opacity(0.2),radius: 4,y: -2)
            Circle()
                .fill(
                    .milk
                )
                .frame(width: 62, height: 62)
                .padding(.horizontal, 16)
                .padding(.top, 5)
                .shadow(color:.shadow,radius: 10,y: 0)
            Text("\(indexone*3+index+1)")
            
        }
        .onTapGesture {
            if Int(password)! == -1{
                password = "\(index+1)"
            }else{
                password += "\(index+1)"
            }
        }
    }
}
struct BottomTab: View {
    let bottonView:[CustomerBottomView]
    var body: some View {
        HStack{
            ForEach(bottonView){index in
                Spacer()
                VStack{
                    Image(systemName: "\(index.image!)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(4)
                    Text("\(index.description!)")
                        .fontWeight(.light)
                        .font(.caption2)
                }
                .foregroundStyle(.images)
                Spacer()
            }
        }
    }
}
