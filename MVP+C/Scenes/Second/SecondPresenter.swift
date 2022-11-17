//
//  Presenter.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation


// Quem vai alterar a view, obrigatoriamente é o presenter
// Final class: não pode ser herdada


final class SecondPresenter {
    
    weak var view: (SecondPresenterOuput)?
    weak var navigation: (SecondPresenterNavigationOutput)?

}


extension SecondPresenter: SecondPresenterInput {
    
    func tap() {
        navigation?.navigateBackToFirstPage()
    }
    
}

