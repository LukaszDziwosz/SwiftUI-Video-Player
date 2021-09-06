//
//  ErrorView.swift
//  ErrorView
//
//  Created by Lukasz Dziwosz on 31/08/2021.
//

import SwiftUI

struct ErrorView: View {
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    VStack {
      Text("Something went wrong")
        .font(.title3)
        .padding()
      Button {
        presentationMode.wrappedValue.dismiss()
      }
      label: {
        Text("Dismiss")
          .font(.title3)
          .bold()
      }
    }
  }
}

struct ErrorView_Previews: PreviewProvider {
  static var previews: some View {
    ErrorView()
  }
}

