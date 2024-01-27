//
//  Dashboard.swift
//  F1Service
//
//  Created by Wishi on 26.12.2023.
//

import SwiftUI

struct Dashboard: View {
    
    var onTappedNextRace: ((NextRaceModel?) -> Void)?
    
    var body: some View {
            ScrollView {
                VStack(spacing: 8) {
                    AppTitle()
                    NextRaceHolder(onItemTapped: { model in
                        //onTappedNextRace?(model)
                    })
                    RaceResultHolder()
                    Standing()
                    RaceList()
                    
                }
            }.padding(.top,1)
            .background(Color("PrimaryColor"))
    }
}

/*
 This view keeps the app title and app icon for Next Race CardView
 */

struct AppTitle: View {
    var body: some View {
        HStack(spacing: 8){            
            Text("F1 Service").font(.custom("KumbhSans-Regular", size: 36))
                .foregroundColor(Color("PrimaryTextColor"))
                .background(Color("Transparent"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,30)
                .padding(.leading,30)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
