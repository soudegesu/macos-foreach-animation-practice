//
//  ContentView.swift
//  macos-foreach-animation-practice
//
//  Created by soudegesu on 2022/01/22.
//

import SwiftUI

struct ContentView: View {
  
    @ObservedObject var state = StateObject()
  
    var body: some View {
      VStack(spacing: 30) {
        HStack {
          ForEach(state.objs) { obj in
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
            DispatchQueue.global().async {
              NotificationCenter.default.post(name: .addItem, object: [])
            }
          })
          Button("remove", action: {
            DispatchQueue.global().async {
              NotificationCenter.default.post(name: .removeItem, object: [])
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
