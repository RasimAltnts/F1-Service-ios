//
//  Counter.swift
//  F1Service
//
//  Created by Wishi on 23.11.2023.
//

import Foundation

class Counter: ObservableObject {
    
    @Published var days: Int = 15
    @Published var hours: Int = 15
    @Published var minutes: Int = 15
    @Published var seconds: Int = 15
    
    
    func startTimer(date: String, time: String) {
       var raceTimeInternalTime = "\(date) \(time)".toDate()
        let calendar: Calendar = Calendar.current
        if let raceTimeInternalTime = raceTimeInternalTime {
            var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date(), to: raceTimeInternalTime)
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.updateTime(with: components)
                components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date(), to: raceTimeInternalTime)
            }
            if components.year == 0 && components.month == 0 && components.day == 0 && components.hour == 0 && components.minute == 0 && components.second == 0 {
                timer.invalidate()
                // Display countdown complete message
            }
        }
    }
    
    private func updateTime(with components: DateComponents) {
        days = Int(components.day ?? 0)
        hours = Int(components.hour ?? 0)
        minutes = Int(components.minute ?? 0)
        seconds = Int(components.second ?? 0)

    }
}
