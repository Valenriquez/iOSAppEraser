//
//  User.swift
//  FirstEraser
//
//  Created by user248068 on 9/11/23.
// ALL the info you wanna get from them, could be Bday, etc, etc

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
 
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return "nothing"
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullname: "Usuario", email: "test@gmail.com")
}
