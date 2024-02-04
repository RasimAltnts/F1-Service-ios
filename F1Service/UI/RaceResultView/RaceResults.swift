//
//  RaceResults.swift
//  F1Service
//
//  Created by Wishi on 29.01.2024.
//

import SwiftUI

struct RaceResults: View {
    
    @StateObject var viewModel = RaceResultViewModel()

    var body: some View {
        VStack(spacing:8) {
            if let result = viewModel.lastRaceResultModel?.mrData.raceTable.races[0] {
                SubTitle(key: result.season + " " + result.raceName + " Results").padding(.top,20)
                Spacer(minLength: 12)
                ScrollView(.vertical) {
                    ForEach(0 ... result.results.count - 1,id: \.self) { index in
                        RaceResultViewItem(
                            imgURL: viewModel.getDriverImage(name: result.results[index].driver.givenName),
                            item: result.results[index]
                        )
                    }
                }
            }
        }
    }
}


struct RaceResultViewItem: View {
    var imgURL: String? = nil
    var item: LastRaceResultsModel.Result? = nil
    
    var body: some View {
        HStack(alignment: .center) {
            if let _item = item {
                Text(_item.position).padding(.leading,12)
                if let _imgURL = imgURL {
                    RaceResultImageView(imgURL: _imgURL).padding(.leading,4)
                }
                Text(_item.driver.givenName + " " + _item.driver.familyName).padding(.leading,4)
                Spacer()
                Text(_item.points + " P").padding(.trailing,12)
            }
        }.frame(width: .infinity, height: .infinity)
            .background(Color("Grey"))
            .cornerRadius(12)
            .padding(.trailing,12)
            .padding(.leading,12)
    }
}

struct RaceResultImageView: View {
    var imgURL: String? = nil
    var body: some View {
        if let url = imgURL {
            AsyncImage(url: URL(string: url)) { shape in
                switch shape {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48,height: 48)
                case .failure(let error):
                    Text("Image Loading Error")
                }
            }.background(Color.white).cornerRadius(4).frame(width: 60,height: 60)
        }
    }
}

#Preview {
    RaceResults()
}
