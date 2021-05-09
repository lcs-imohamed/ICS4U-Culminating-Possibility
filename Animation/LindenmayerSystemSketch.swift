//
//  LindemayerSystemSketch.swift
//  Animation
//
//  Created by Russell Gordon on 2021-05-04.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class LindenmayerSystemSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        // Enable faster rendering
        canvas.highPerformance = true
        
        var system = LindenmayerSystem(axiom: "F",
                                       rules: [
                                        
                                        "F": [
                                            Successor(odds: 4, text: "XX[+FZ++F-X[+ZF]][-F++X-F]"),
                                            Successor(odds: 3, text: "XX[-FZ--F+X[-ZF]][+F--X+F]"),
                                           
                                        ],
                                        
                                        "X": [
                                            Successor(odds: 1, text: "XF[XF[+FX]]"),
                                            Successor(odds: 4, text: "XF[XF[+++FX]]")
                                        
                                        ],
                                        
                                        "Z": [
                                            Successor(odds: 2, text: "[+X-F-X][++ZF]"),
                                            Successor(odds: 5, text: "[-X+F+X][--ZF]")
                                        
                                        
                                        ],
                                        
                                      
                                        
                                        
                                       ],
                                       
                                       generations: 4)
        
        var visualizedSystem = Visualizer(for: system,
                                          on: canvas,
                                          length: 10,
                                          reduction: 1,
                                          angle: 10,
                                          initialPosition: Point(x: 250, y: 0),
                                          initialHeading: 90)
        
        
    
        
        visualizedSystem.render()
      
        
    }
    
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
    
}

