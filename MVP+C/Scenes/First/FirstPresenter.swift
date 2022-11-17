//
//  Presenter.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation


// Quem vai alterar a view, obrigatoriamente é o presenter
// Final class: não pode ser herdada


final class FirstPresenter {
    
    weak var view: (FirstPresenterOuput)?
    weak var navigation: (FirstPresenterNavigationOutput)?

}


extension FirstPresenter: FirstPresenterInput {
    
    func textField(value: String) {
        
        view?.updateLabel(value: value)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.navigation?.navigateToNextPage()
        }
        //print(value)
    }
}
