//
//  StateObject.swift
//  macos-foreach-animation-practice
//
//  Created by soudegesu on 2022/01/22.
//

import SwiftUI

struct Obj: Identifiable {
  var id = UUID().uuidString
}

class StateObject : ObservableObject {
  
  @Published var objs: [Obj] = []
  
  init() {
    NotificationCenter.default.addObserver(
      self, selector: #selector(addItem(note:)),
      name: .addItem,
      object: nil
    )
    NotificationCenter.default.addObserver(
      self, selector: #selector(removeItem(note:)),
      name: .removeItem,
      object: nil
    )
  }
  
  @objc
  private func addItem(note: Notification?) {
    DispatchQueue.main.async { [weak self] in
      withAnimation(.easeOut(duration: 0.3)) {
        self?.objs.append(Obj())
      }
    }
  }
  
  @objc
  private func removeItem(note: Notification?) {
    DispatchQueue.main.async { [weak self] in
      withAnimation(.easeIn(duration: 0.3)) {
        self?.objs = self?.objs.dropLast() ?? []
      }
    }
  }
  
}
