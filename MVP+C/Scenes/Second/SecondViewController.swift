//
//  ViewController.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation
import UIKit


final class SecondViewController: UIViewController, ViewCode {
    
    private var presenter: SecondPresenterInput?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Início"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    func setHierarchy() {
        view.addSubview(label)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    init(presenter: SecondPresenterInput){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        presenter?.tap()
    }
    
}


extension SecondViewController: SecondPresenterOuput{
    func loadInitialState() {
        view.backgroundColor = .blue
        title = "Second View"
    }
}
