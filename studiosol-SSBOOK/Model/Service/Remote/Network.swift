//
//  Network.swift
//  studiosol-SSBOOK
//
//  Created by cassio luciano on 28/10/22.
//

import Apollo

class Network {
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://us-central1-ss-devops.cloudfunctions.net/GraphQL")!)
}
