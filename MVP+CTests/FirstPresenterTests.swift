//
//  FirstPresenterTests.swift
//  MVP+CTests
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import XCTest
@testable import MVP_C

class FirstPresenterOutputDouble: FirstPresenterOuput {

    var calledLoadInitialState: Bool = false
    var calledUpdateLabel: Bool = false
    
    func loadInitialState() {
        calledLoadInitialState = true
    }
    
    func updateLabel(value: String) {
        calledUpdateLabel = true
    }
}

final class FirstPresenterTests: XCTestCase {

    // MARK: - Gabi: estudar doubles, e nomenclatura de testes unitarios (tanto o nome que damos pras funcoes quanto o uso de given/when/then e sut
    func testLoadInitialState() {
        // given
        let sut = FirstPresenter() // sut é system under test
        let view = FirstPresenterOutputDouble()
        sut.view = view
        
        // when
        sut.view?.loadInitialState()
        
        // then
        XCTAssert(view.calledLoadInitialState)
    }

}
