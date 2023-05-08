//
//  LoadingViewTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 09/05/23.
//

import XCTest
@testable import Planetz

final class LoadingViewTests: XCTestCase {

    var loadingView: LoadingView?
    
    override func setUp() {
        loadingView = LoadingView()
    }

    func testLoadingView_whenStartLoading() throws {
        let sut = try XCTUnwrap(self.loadingView)
        sut.testSupport.startAnimating()
        
        XCTAssertTrue(sut.testSupport.activityIndicator.isAnimating)
    }
    
    func testLoadingView_whenInitialState() throws {
        let sut = try XCTUnwrap(self.loadingView)
        XCTAssertFalse(sut.testSupport.activityIndicator.isAnimating)
    }
    
    override func tearDown() {
        loadingView = nil
    }

}
