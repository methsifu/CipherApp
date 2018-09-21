import XCTest
@testable import SpyApp

class NumbersCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = NumberCipher()
    }
    
    func test_oneUnicodeValueGetsMappedToSelfWith_1_secret() {
        let plaintext = "81"
        
        let result = cipher.encode("P", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    
    
}
