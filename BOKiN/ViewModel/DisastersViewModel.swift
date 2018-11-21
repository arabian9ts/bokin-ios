//
//  DisasterViewModel.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import RxSwift

class DisastersViewModele {
    var disasters: Variable<[Disaster]> = Variable([])
    
    init() {}
    
    func fetchDisasters() {
        let request = BokinAPI.GetDisasters()
        APIClient().send(request: request) { result in
            switch result {
            case .success(let model):
                self.disasters.value = model!.disasters
            case .failure(let error):
                print(error)
            }
        }
    }
}
