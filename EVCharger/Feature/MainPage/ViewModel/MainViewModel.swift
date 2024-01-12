//
//  MainViewModel.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import Foundation
import Combine



public class MainViewModel: ObservableObject {
    
    @Published var data: [ChargerInfo] = []
    @Published var searchResultData: [ChargerInfo] = []
    
    
    func networking() {
        NetworkManager.shared.fetchVideo(completion: { result in
            switch result {
            case .success(let data):
                self.data = data
                
            case .failure:
                print("테스트 - ERROR")
            }
        })
    }
    
}
