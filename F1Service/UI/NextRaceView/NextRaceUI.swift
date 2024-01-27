//
//  NextRaceUI.swift
//  F1Service
//
//  Created by Wishi on 24.01.2024.
//

import SwiftUI

struct NextRaceUI: View {
    @State var model: NextRaceModel?
    
    init(model: NextRaceModel? = nil) {
        self.model = model
        print(model)
    }
    
    var body: some View {
        HStack {
            Text("Hello, World!")
        }.frame(maxWidth: 400, maxHeight: 400).background(Color.red)
    }
}

#Preview {
    NextRaceUI()
}
