//
//  IndentView.swift
//  HITFit
//
//  Created by Manukant Tyagi on 03/09/24.
//

import SwiftUI

struct IndentView<Content:View>: View {
    var content: Content
    var body: some View {
        ZStack {
            content
                .background(
                    GeometryReader(content: { geometry in
                        Circle()
                            .inset(by: -4)
                            .stroke(Color.background,lineWidth: 8)
                            .shadow(color: .dropShadow.opacity(1), radius: 6, x: 6, y: 6)
                            .shadow(color: .dropHighlight, radius: 6, x: -6, y: -6)
                            .foregroundColor(.background)
                            .clipShape(Circle().inset(by: -1))
                            .resized(size: geometry.size)
                    })


                )
        }
    }

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}
private extension View {
  func resized(size: CGSize) -> some View {
    self
      .frame(
        width: max(size.width, size.height),
        height: max(size.width, size.height))
      .offset(y: -max(size.width, size.height) / 2
        + min(size.width, size.height) / 2)
  }
}


#Preview {
    IndentView {
        Text("i")
            .font(.system(size: 90, design: .rounded))
            .frame(width: 120, height: 120)
    }
}
