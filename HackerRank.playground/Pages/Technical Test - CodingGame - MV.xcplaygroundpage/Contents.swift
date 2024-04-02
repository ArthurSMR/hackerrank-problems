func dramatize(_ str: String) -> String {
    
    var dramatizedStr = ""
    
    for char in str {
        
        if char == "." {
            dramatizedStr = dramatizedStr + "!"
        } else if char == "!" {
            dramatizedStr = dramatizedStr + String(char) + "!"
        }
        else {
            dramatizedStr = dramatizedStr + String(char)
        }
    }
    
    return dramatizedStr
}

print(dramatize("Fé que agora. Eu. Vou. Passar!!"))
