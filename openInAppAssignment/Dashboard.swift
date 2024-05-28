//
//  Dashboard.swift
//  openInAppAssignment
//
//  Created by Ashish Dutt on 28/05/24.
//

import Foundation

struct Dashboard: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let supportWhatsAppNumber: String
    let extraIncome: Double
    let totalLinks: Int
    let totalClicks: Int
    let todayClicks: Int
    let topSource: String
    let topLocation: String
    let startTime: String
    let linksCreatedToday: Int
    let appliedCampaigns: Int
    let data: DashboardData
    
    enum Codingkeys: String, CodingKey {
        case status, statusCode, message
        case supportWhatsAppNumber = "support_whatsapp_number"
        case extraIncome = "extra_income"
        case totalLinks = "total_links"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case startTime
        case linksCreatedToday = "links_created_today"
        case appliedCampaigns = "applied_campaigns"
        case data
    }
}

struct DashboardData: Codable {
    let recentLinks: [LinkData]
    let topLinks: [LinkData]
    let favouriteLinks: [LinkData]
    let overallUrlChart: [String: Int]
    
    enum CodingKeys: String, CodingKey {
        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case favouriteLinks = "favourite_links"
        case overallUrlChart = "overall_url_chart"
    }
}

struct LinkData: Codable {
    let urlID: Int
    let webLink: String
    let smartLink: String
    let title: String
    let totalClicks: Int
    let originalImage: String?
    let thumbnail: String?
    let timesAgo: String
    let createdAt: String
    let domainID: String
    let urlPrefix: String?
    let urlSuffix: String?
    let app: String
    let isFavourite: Bool
    
    enum Codingkeys: String, CodingKey {
        case urlID = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case thumbnail
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainID = "domain_id"
        case urlPrefix = "url_prefix"
        case urlSuffix = "url_suffix"
        case app
        case isFavourite = "is_favourite"
    }
    
}
