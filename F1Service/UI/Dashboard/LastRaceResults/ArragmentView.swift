//
//  ArragmentView.swift
//  F1Service
//
//  Created by Wishi on 31.12.2023.
//

import SwiftUI

struct ArragmentView: View {
    var driver: String = ""
    var time: String = ""
    var body: some View {
        VStack(spacing: 8) {
            UnderlineView(
            item1: "Fastest Lap",
            item2: driver,
            item3: time
            )
        }
    }
}

#Preview {
    ArragmentView()
}
