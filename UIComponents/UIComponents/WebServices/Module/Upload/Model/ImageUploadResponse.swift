//
//  ImageUploadResponse.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/06/23.
//

import Foundation

// MARK: struct for Upload Image
struct ImageUploadResponse: Codable {
    let data: DataClass?
    let success: Bool?
    let status: Int?
}

struct DataClass: Codable {
    let id, title: String?
    let urlViewer: String?
    let url, displayURL: String?
    let width, height, size, time: Int?
    let expiration: Int?
    let image, thumb, medium: ImageContext?
    let deleteURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case urlViewer
        case url
        case displayURL = "display_url"
        case width, height, size, time, expiration, image, thumb, medium
        case deleteURL = "delete_url"
    }
}

struct ImageContext: Codable {
    let filename, name, mime, imageExtension: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case filename, name, mime
        case imageExtension = "extension"
        case url
    }
}


