//
//  RaceListPage.swift
//  F1Service
//
//  Created by Wishi on 5.02.2024.
//

import SwiftUI

struct RaceListPage: View {
    @StateObject var viewModel: RaceListViewModel = RaceListViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    RaceListPage()
}
