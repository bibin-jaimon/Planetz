//
//  InfoViewTests.swift
//  PlanetzTests
//
//  Created by Bibin Jaimon on 08/05/23.
//

import XCTest
@testable import Planetz

final class InfoViewTests: XCTestCase {

    func testInfoView_whenSettingAMessage_shouldhaveSetToLabelCorrectly() throws {
        let sut = InfoView(frame: .zero)
        let input = "Hello"
        sut.set(message: input)
        
        let actualMessage = sut.testSupport.infoMessageLabel.text
        XCTAssertEqual(input, actualMessage)
    }

}
