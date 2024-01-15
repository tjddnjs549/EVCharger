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
    var disposableBag = Set<AnyCancellable>()
    
    func networking(completion: @escaping () -> ()) {
        NetworkManager.shared.fetchVideo(completion: { result in
            switch result {
            case .success(let data):
                self.data = data
                completion()
            case .failure:
                print("테스트 - ERROR")
            }
        })
        
    }
    
}


