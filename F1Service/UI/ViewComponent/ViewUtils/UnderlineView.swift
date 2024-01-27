//
//  UnderlineView.swift
//  F1Service
//
//  Created by Wishi on 31.12.2023.
//

import SwiftUI

struct UnderlineView: View {
    var item1: String = "item1"
    var item2: String = "item2"
    var item3: String = "item3"
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text(item1).font(.custom("KumbhSans-Regular", size: 18))
                Spacer()
                Text(item2).font(.custom("KumbhSans-Regular", size: 18))
                Spacer()
                Text(item3).font(.custom("KumbhSans-Regular", size: 18))

            }
            Underline()
        }
        .padding(10)
    }
}


struct Underline: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)  // Adjust height as needed
            .foregroundColor(.black)
    }
}

#Preview {
    Underline()
}


#Preview {
    UnderlineView()
}
