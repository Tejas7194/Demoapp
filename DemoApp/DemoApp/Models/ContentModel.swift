//
//  ContentModel.swift
//  DemoApp
//
// Created by Tejas Todkar on 26/12/24.
//

import Foundation

struct ContentModel: Codable {
    var identifier = UUID()
    var value: String?
    var fullName, address, image: String?
    var dob: Int?
    var isAccepted: Bool?
    var imageData: Data?
}
