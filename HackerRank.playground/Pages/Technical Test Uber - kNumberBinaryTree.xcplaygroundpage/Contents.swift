// MARK: - Technical Test 24/01/24

class BinaryTreeSolution {
    
    class Node {
        var value: Int
        var left: Node?
        var right: Node?
        var hasPassed: Bool = false
        
        init(value: Int) {
            self.value = value
        }
    }
    
    static func run() {
        
        // Voce pode mudar o método de createTree para alterar a árvore de teste.
        let tree = createTree2()
        print(kValue(forRoot: tree, k: 2))
    }
    
    /*
     Criar um método que receba uma árvore binária e um k (do maior pro menor número).
     Exemplo: Se eu tenho uma árvore:
     
     Apenas números positivos
     
            10
           /  \
         4      20
        /      /  \
       2      15   40
                17
     para k: 1 => output = 40
     para k: 2 => output = 20
     para k: 3 => output = 17
     */
    
    private static func kValue(forRoot root: Node, k: Int) -> Int {
        var passedRoots: [Node?] = []
        var currentRoot: Node? = root
        var result: [Int] = []
        
        while currentRoot != nil || !passedRoots.isEmpty {
            
            // Anda para direita se tiver um nó e ele não passou ainda
            if let rightNode = currentRoot?.right, !rightNode.hasPassed {
                passedRoots.append(currentRoot)
                currentRoot = rightNode
            }
            
            else {
                result.append(currentRoot?.value ?? 0)
                currentRoot?.hasPassed = true
                
                // Para melhorar a eficiencia, se o número k já foi encontrado, já retorna o quanto antes.
                if result.count == k {
                    return result[k - 1]
                }
                
                // Anda para esquerda se tiver um nó e ele não passou ainda
                if let leftNode = currentRoot?.left, !leftNode.hasPassed {
                    currentRoot = leftNode
                }
                
                // Utilizado para não perder a referencia do nó acima
                else if let lastPassed = passedRoots.last {
                    currentRoot = lastPassed
                    passedRoots.removeLast()
                }
                
                // Irá parar a execução do loop
                else {
                    currentRoot = nil
                }
            }
        }
        
        guard result.count >= k else { return -1 }
        
        return result[k - 1]
    }

    /*
     
     Tree1
     
            10
           /  \
         4      20
        /      /  \
       2      15   40
                \
                17
     
     para k: 1 => output = 40
     para k: 2 => output = 20
     para k: 3 => output = 17
     */
    private static func createTree1() -> Node {
        
        let root = Node(value: 10)
        let node4 = Node(value: 4)
        let node2 = Node(value: 2)
        
        let node20 = Node(value: 20)
        let node15 = Node(value: 15)
        let node17 = Node(value: 17)
        let node40 = Node(value: 40)
        
        root.left = node4
        root.right = node20
        
        node4.left = node2
        
        node15.right = node17
        
        node20.left = node15
        node20.right = node40
        
        return root
    }
    
    /*
     Tree2
     
            10
           /
         4
        /
       2
     
     para k: 1 => output = 10
     para k: 2 => output = 4
     para k: 3 => output = 2
     para k: 10 => output = -1
     */
    private static func createTree2() -> Node {
        
        let root = Node(value: 10)
        let node4 = Node(value: 4)
        let node2 = Node(value: 2)
        
        root.left = node4
        node4.left = node2
        
        return root
    }
}


BinaryTreeSolution.run()
