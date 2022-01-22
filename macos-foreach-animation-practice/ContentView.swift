//
//  ContentView.swift
//  macos-foreach-animation-practice
//
//  Created by soudegesu on 2022/01/22.
//

import SwiftUI

struct Obj: Identifiable {
  var id = UUID().uuidString
}

struct ContentView: View {
  
  @State var objs: [Obj] = []
  
    var body: some View {
      VStack(spacing: 30) {
        HStack {
          ForEach(objs) { obj in
            ZStack {
              Rectangle()
                .background(Color.gray)
                .cornerRadius(20)
                .frame(width: 30, height: 30, alignment: .center)
              Text(obj.id)
                .foregroundColor(.white)
            }.transition(.scale)
          }
        }
        HStack(spacing: 10) {
          Button("add", action: {
            withAnimation(.easeOut(duration: 0.3)) {
              objs.append(Obj())
            }
          })
          Button("remove", action: {
            withAnimation(.easeIn(duration:0.3)) {
              objs = objs.dropLast()
            }
          })
        }
      }.padding(.all, 20)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
