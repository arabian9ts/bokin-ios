//
//  DonationViewModel.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import RxSwift

class DonationViewModel {
    var donations: Variable<[Donation]> = Variable([])
    
    init() {}
    
    func fetchDonations(disasterId: Int) {
        let request = BokinAPI.GetDonations.init(disasterId: disasterId)
        APIClient().send(request: request) { result in
            switch result {
            case .success(let model):
                self.donations.value = model!.donations
                Unique.shared.donations = model!.donations
                print(model?.donations)
            case .failure(let error):
                print(error)
            }
        }
    }
}
