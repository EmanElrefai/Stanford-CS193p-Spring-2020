//
//  SizeClassWithAnyView.swift
//  Bookworm
//
//  Created by Eman on 11/14/20.
//

import SwiftUI

struct SizeClassWithAnyView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class: ")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class: ")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    }
}

struct SizeClassWithAnyView_Previews: PreviewProvider {
    static var previews: some View {
        SizeClassWithAnyView()
    }
}
