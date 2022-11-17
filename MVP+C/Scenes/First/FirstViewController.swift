//
//  ViewController.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import UIKit


//presenter

//presenterInput

//presenterOutput



final class FirstViewController: UIViewController, ViewCode {
    
    private var presenter: FirstPresenterInput?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Início"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(presenter: FirstPresenterInput){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
    
    func setHierarchy(){
        view.addSubview(label)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setHierarchy()
        setConstraints()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.presenter?.textField(value: "Mudou o estado :)")
        }
        
    }
    

}

extension FirstViewController: FirstPresenterOuput{
    
    func updateLabel(value: String) {
        self.label.text = value
    }
    
    func loadInitialState() {
        view.backgroundColor = .red
        title = "FirstView"
    }
    
}

