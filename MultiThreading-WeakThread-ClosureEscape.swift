//
//  MultiThreading-WeakThread-ClosureEscape.swift
//  Decoding
//
//  Created by Harshit Raj on 02/04/26.
//

// going to the Global background by using userInitiate and then fetching the data or saving the data in the forward by using main

import Foundation
import Combine
import SwiftUI

class NetworkManager {
    // Simulates a heavy network request
    func fetchDashboardData(completion: @escaping (String) -> Void) {
        // for stimulating, heavy task, be used.global and userinitiated to move the to remove the user task on the main stream because it makes our apps smooth
        // unerInitiated used to move the task which is for user or something that user is waiting so that it can turn really quick to the user debt cause this app to seem smooth
        // userInteractive is used from the ui load beacuse it is very necessary
        DispatchQueue.global(qos: .userInitiated).async {
            let data = "Critical Dashboard Metrics"
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}

class DashboardViewModel: ObservableObject {
    
    @Published var metrics: String = "Loading..."
    private let networkManager = NetworkManager()
    
    init() {
        print("DashboardViewModel Initialized")
    }
    
    deinit {
        print("DashboardViewModel Destroyed")
    }
    
    func loadData() {
        //[weak self] is used for memory leak
        networkManager.fetchDashboardData {[weak self] result in
            // self is now optional, because it might have been destroyed!
            self?.metrics = result
        }
    }
}
