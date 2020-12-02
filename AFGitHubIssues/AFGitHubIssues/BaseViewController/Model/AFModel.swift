//
//  AFModel.swift
//  AFGitHubIssues
//
//  Created by Ajithram on 02/12/20.
//

import Foundation

struct AFDatas: Decodable {
    var title: String?
    var created_at: String
    var user: User?
}

struct User: Decodable {
    var login: String?
    var avatar_url: String?
}
