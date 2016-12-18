//
//  main.swift
//  GGGraph
//
//  Created by 張子晏 on 2016/12/8.
//  Copyright © 2016年 張子晏. All rights reserved.
//

import Foundation
import Cocoa

var checkString = [String: Bool]()

func randomString(length: Int) -> String {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var string = ""
    
    for _ in 0 ..< length {
        let rand = arc4random_uniform(len)
        var nextChar = letters.character(at: Int(rand))
        string += NSString(characters: &nextChar, length: 1) as String
    }
    
    if checkString[string] != nil {
        string = randomString(length: length)
    }
    checkString[string] = true
    
    return string
}

var graph = [String: [[String: Any]]]()
var nodes = [[String: Any]]()
var links = [[String: Any]]()

for _ in 0 ..< 10 {
    let node: [String : Any] = ["id": randomString(length: 3), "group": 1]
    
    nodes.append(node)
}

func checkLinkExist(source: String, target: String) -> Bool {
    for link in links {
        if link["source"] as! String == source && link["target"] as! String == target {
            return true
        }
    }
    return false
}

for _ in 0 ..< 20 {
    var sourceNode: String
    var targetNode: String
    
    repeat {
        let source = Int(arc4random_uniform(UInt32(nodes.count)))
        let target = Int(arc4random_uniform(UInt32(nodes.count)))
        sourceNode = nodes[source]["id"] as! String
        targetNode = nodes[target]["id"] as! String
    } while(checkLinkExist(source: sourceNode, target: targetNode))

    let link: [String : Any] = ["source": sourceNode, "target": targetNode, "value": 1]
    
    links.append(link)
}

print(nodes)
print(links)

graph["nodes"] = nodes
graph["links"] = links


let json = JSON(graph)
let str = json.debugDescription
let data = str.data(using: .utf8)

if let path = Bundle.main.path(forResource: "data", ofType: "json") {
    do {
        try str.write(toFile: path, atomically: false, encoding: .utf8)
    } catch {
        print(error)
    }
    
    print(path)
}

let fileLocation = Bundle.main.path(forResource: "graph", ofType: "html")

if let path = fileLocation, NSWorkspace.shared().openFile(path, withApplication: "Safari") {
    print("default browser was successfully opened")
}


//import JavaScriptCore
//
//let fileLocation = Bundle.main.path(forResource: "d3", ofType: "js")
//let jsSource: String = try! String(contentsOfFile: fileLocation!, encoding: String.Encoding.utf8)
//let context = JSContext()
//
//_ = context?.evaluateScript(jsSource)
//
//let getPathFunc = context?.objectForKeyedSubscript("path")
//
//print(getPathFunc!)
//let result = getPathFunc?.call(withArguments: [[10, 2, 29, 4, 8, 20, 0, 4], [500,  500]])
//
//print(result!)
