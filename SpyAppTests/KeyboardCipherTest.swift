import XCTest
@testable import SpyApp

class KeyboardCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = KeyboardCipher()
    }
    
    func test_oneLetterGetsMappedToSelfWith_1_secret() {
        let plaintext = "Q"
        
        let result = cipher.encode("A", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
    func test_oneLetterGetsMappedWith1Secret() {
        let plaintext = "A"
        let result = cipher.decrypt("Q", secret: "1")
        
        XCTAssertEqual(plaintext, result)
    }
    
}
