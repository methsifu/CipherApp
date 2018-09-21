import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
}
struct AlphaNumericCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var isAlphaNumeric = true
        let alpha = CharacterSet.alphanumerics
        for uni in plaintext.unicodeScalars {
            if !alpha.contains(uni) {
                isAlphaNumeric = false
            }
        }
        let uppercased = plaintext.uppercased()
        if isAlphaNumeric == true {
            guard let shiftBy = UInt32(secret) else {
                return nil
            }
            var encoded = ""
            
            for character in uppercased {
                let unicode = character.unicodeScalars.first!.value
                var shiftedUnicode = unicode + shiftBy
                if shiftedUnicode > 57 && shiftedUnicode < 65
                {
                    shiftedUnicode = (shiftedUnicode - 57) + 64
                }
                else if shiftedUnicode > 90
                {
                    shiftedUnicode = (shiftedUnicode - 90) + 47
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            return encoded
        } else {
            return "Please only use Alphanumerics"
        }
        
        
    }
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            if shiftedUnicode < 48
            {
                shiftedUnicode = shiftedUnicode + 90 - 47
            }
            else if shiftedUnicode < 65 && shiftedUnicode > 58
            {
                shiftedUnicode = shiftedUnicode - 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
}
struct NumberCipher: Cipher {
        
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        let uppercased = plaintext.uppercased()
        var encoded = ""
            
        for character in uppercased {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = UInt8(shiftedUnicode)
            encoded = encoded + String(shiftedCharacter) + " "
        }
        return encoded
        }
    func decrypt(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        let uppercased = plaintext.uppercased()
        var encoded = ""
        
        for character in uppercased {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = UInt8(shiftedUnicode)
            encoded = encoded + String(shiftedCharacter) + " "
        }
        return encoded
    }
    
}
struct KeyboardCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var isAlpha = true
        let alpha = CharacterSet.letters
        for uni in plaintext.unicodeScalars {
            if !alpha.contains(uni) {
                isAlpha = false
            }
        }
        let uppercased = plaintext.uppercased()
        if (isAlpha == true) {
        for character in uppercased {
            if (character == "A"){
                encoded = encoded + "Q"
            }
            if (character == "B"){
                encoded = encoded + "W"
            }
            if (character == "C"){
                encoded = encoded + "E"
            }
            if (character == "D"){
                encoded = encoded + "R"
            }
            if (character == "E"){
                encoded = encoded + "T"
            }
            if (character == "F"){
                encoded = encoded + "Y"
            }
            if (character == "G"){
                encoded = encoded + "U"
            }
            if (character == "H"){
                encoded = encoded + "I"
            }
            if (character == "I"){
                encoded = encoded + "O"
            }
            if (character == "J"){
                encoded = encoded + "P"
            }
            if (character == "K"){
                encoded = encoded + "A"
            }
            if (character == "L"){
                encoded = encoded + "S"
            }
            if (character == "M"){
                encoded = encoded + "D"
            }
            if (character == "N"){
                encoded = encoded + "F"
            }
            if (character == "O"){
                encoded = encoded + "G"
            }
            if (character == "P"){
                encoded = encoded + "H"
            }
            if (character == "Q"){
                encoded = encoded + "J"
            }
            if (character == "R"){
                encoded = encoded + "K"
            }
            if (character == "S"){
                encoded = encoded + "L"
            }
            if (character == "T"){
                encoded = encoded + "Z"
            }
            if (character == "U"){
                encoded = encoded + "X"
            }
            if (character == "V"){
                encoded = encoded + "C"
            }
            if (character == "W"){
                encoded = encoded + "V"
            }
            if (character == "X"){
                encoded = encoded + "B"
            }
            if (character == "Y"){
                encoded = encoded + "N"
            }
            if (character == "Z"){
                encoded = encoded + "M"
            }
        }
        return encoded
        } else {
            return "Please only use Letters"
        }
    }
    func decrypt(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var isAlpha = true
        let alpha = CharacterSet.letters
        for uni in plaintext.unicodeScalars {
            if !alpha.contains(uni) {
            isAlpha = false
            }
        }
        let uppercased = plaintext.uppercased()
        for character in uppercased {
            if (character == "Q"){
                encoded = encoded + "A"
            }
            if (character == "W"){
                encoded = encoded + "B"
            }
            if (character == "E"){
                encoded = encoded + "C"
            }
            if (character == "R"){
                encoded = encoded + "D"
            }
            if (character == "T"){
                encoded = encoded + "E"
            }
            if (character == "Y"){
                encoded = encoded + "F"
            }
            if (character == "U"){
                encoded = encoded + "G"
            }
            if (character == "I"){
                encoded = encoded + "H"
            }
            if (character == "O"){
                encoded = encoded + "I"
            }
            if (character == "P"){
                encoded = encoded + "J"
            }
            if (character == "A"){
                encoded = encoded + "K"
            }
            if (character == "S"){
                encoded = encoded + "L"
            }
            if (character == "D"){
                encoded = encoded + "M"
            }
            if (character == "F"){
                encoded = encoded + "N"
            }
            if (character == "G"){
                encoded = encoded + "O"
            }
            if (character == "H"){
                encoded = encoded + "P"
            }
            if (character == "J"){
                encoded = encoded + "Q"
            }
            if (character == "K"){
                encoded = encoded + "R"
            }
            if (character == "L"){
                encoded = encoded + "S"
            }
            if (character == "Z"){
                encoded = encoded + "T"
            }
            if (character == "X"){
                encoded = encoded + "U"
            }
            if (character == "C"){
                encoded = encoded + "V"
            }
            if (character == "V"){
                encoded = encoded + "W"
            }
            if (character == "B"){
                encoded = encoded + "X"
            }
            if (character == "N"){
                encoded = encoded + "Y"
            }
            if (character == "M"){
                encoded = encoded + "Z"
            }
        }
    return encoded
    }
}
