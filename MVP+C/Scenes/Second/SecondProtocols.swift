//
//  Protocols.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation

// É implementado pela Presenter e chamado pela ViewController (View)
// Representação da controller
// Chamada -> "View"Controller
// Receber -> Preesenter

//Tipo escrever um texto no UITextField e a presenter recebe

protocol SecondPresenterInput: AnyObject{
    func tap()
}


//É implementado pela ViewControlado e chamado pela presenter
// representação da View
// Chamada -> Presenter
// Recebe -> "View"Controller

protocol SecondPresenterOuput: AnyObject{
    //func changeBackground(color: UIColor)
    func loadInitialState()
}

protocol SecondPresenterNavigationOutput: AnyObject{
    
    func navigateBackToFirstPage()
}

