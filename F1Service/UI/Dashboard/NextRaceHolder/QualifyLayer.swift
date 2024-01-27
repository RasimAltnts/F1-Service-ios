//
//  QualifyLayer.swift
//  F1Service
//
//  Created by Wishi on 31.12.2023.
//

import SwiftUI

struct QualifyLayer: View {
    var item1: String = "Qualify Time"
    var item2: String = "29/11/2024 Thur"
    var item3: String = "14:00 PM"
    
    var body: some View {
        UnderlineView(item1: item1, item2: item2, item3: item3)
    }
}

#Preview {
    QualifyLayer()
}
