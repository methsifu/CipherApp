import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "AlphNum": AlphaNumericCipher(),
        "Numbers": NumberCipher(),
        "Keyboard": KeyboardCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
