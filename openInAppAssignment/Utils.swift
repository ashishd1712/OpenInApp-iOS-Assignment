//
//  Utils.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 30/05/24.
//

import Foundation

func generateChartData() -> [String: Int]{
    var data = [String: Int]()
    
    for i in 0..<12 {
        let timeString = String(format: "%02d:00", i)
        data[timeString] = Int.random(in: 0...50)
    }
     return data
}

func formatDateString(_ dateString: String) -> String? {
    // Create a DateFormatter for the input format
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    inputFormatter.locale = Locale(identifier: "en_US_POSIX")
    
    // Parse the input date string to a Date object
    guard let date = inputFormatter.date(from: dateString) else {
        return nil
    }
    
    // Create a DateFormatter for the output format
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "dd MMM yyyy"
    outputFormatter.locale = Locale(identifier: "en_US_POSIX")
    
    // Format the Date object to the desired string format
    return outputFormatter.string(from: date)
}
