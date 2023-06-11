import UIKit

class Node {
    private var next: Node?
    private var data: String
    
    init(data: String) {
        self.data = data
    }
    
     func getData() -> String {
        return self.data
    }
    
     func setData(data: String) {
         self.data = data
     }
     
     func getNext() -> Node? {
         return self.next
     }
     
     func setNext(node: Node) {
         self.next = node
     }
}

extension Node: CustomStringConvertible {
    var description: String {
        return self.getData()
    }
}

class LinkedList {
    private var head: Node?
    private var tail: Node?
    init(head: Node? = nil) {
        self.head = head
    }
    func setHead(node: Node) {
        self.head = node
    }
    
    func getHead() -> Node? {
        return self.head
    }
    
    func append(node: Node) {
        guard let _ = head else {
            self.head = node
            self.tail = node
            return
        }
        tail?.setNext(node: node)
        tail = tail?.getNext()
    }
    
    func lengthOfLinkedList() -> Int {
       var len = 0
       var node = self.head
        while node != nil {
            len += 1
            node = node?.getNext()
        }
        
       return len
    }
    
    
    func findMidleElements() -> Node? {
        let len  = lengthOfLinkedList()
        if len <= 0 {
            return nil
        }
        var node: Node? = self.head
        for _ in 0..<lengthOfLinkedList()/2 {
            node = node?.getNext()
        }
        return node
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var node = self.head
        var linkedlist =  node?.description ?? ""
        node = node?.getNext()
        while node != nil {
            linkedlist += " --> " + (node?.description ?? "")
            node = node?.getNext()
        }
        return linkedlist
    }
}


var linkedList = LinkedList()
var node = Node(data: "first")
linkedList.append(node: node)
var node2 = Node(data: "second")
linkedList.append(node: node2)
var node3 = Node(data: "Third")
linkedList.append(node: node3)
var node4 = Node(data: "Fourth")
linkedList.append(node: node4)
var node5 = Node(data: "Fifth")
linkedList.append(node: node5)
var node6 = Node(data: "Sixth")
linkedList.append(node: node6)
var node7 = Node(data: "Seventh")
linkedList.append(node: node7)

print(linkedList)
print(linkedList.findMidleElements())
