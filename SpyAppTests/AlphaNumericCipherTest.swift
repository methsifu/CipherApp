import XCTest
@testable import SpyApp

class AlphaNumericCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphaNumericCipher()
    }
    
    func test_oneLetterGetsMappedToSelfWith_1_secret() {
        let plaintext = "B"
        
        let result = cipher.encode("A", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_oneLetterGetsMappedWith1Secret() {
        let plaintext = "A"
        let result = cipher.decrypt("B", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    
    
}
