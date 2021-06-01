//
//  FlowerSketch.swift
//  Animation
//
//  Created by Mohamed, Ilana on 2021-05-29.
//

import Foundation
import CanvasGraphics

// NOTE: This is a completely empty sketch; it can be used as a template.
class FlowerSketch: NSObject, Sketchable {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    var canvas: Canvas
    
    // This function runs once
    override init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 500)
        
        
        // Make diamond
        //    [++F++F+F++F-]
        // Enable faster rendering
        canvas.highPerformance = true
        
        // Create the basic L-system
        var flowerSystem = LindenmayerSystem(axiom: "S", rules: [
            
            "S": [Successor(odds: 1, text: """
                                            [+++XL][+f+f+fA]

                                            """),
            ],
            
            "X": [Successor(odds: 1, text: """
                                            FF[+X][-X]FFX
                                            
                                            """),
                
            ],
            
            "A": [Successor(odds: 2, text: """
                                            
                                            [L]
                                            [++ffffffffL]
                                            [-ffffffL]

                                            
                                            """),
                  
                  Successor(odds: 2, text: """
                                              [+fffffffL]
                                              [-ffffffL]
                                              """),
            ],
            
            
            
            "L": [Successor(odds: 2, text: """
                                            0[F----F++F----F++F----F++F----F++F----F++F----F]
                                            1[----F++++F----f----F++++F----f----F++++F]

                                            """),
                  Successor(odds: 1, text: """
                                                  2[F----F++F----F++F----F++F----F++F----F++F----F]
                                                  3[----F++++F----f----F++++F----f----F++++F]

                                                  """),
            ],
        ],
        generations: 5)
        
        
        
        // Visualize the system
        var visualizedFlower = Visualizer(for: flowerSystem,
                                          on: canvas,
                                          length: 405,
                                          reduction: 2,
                                          angle: 30,
                                          initialPosition: Point(x: 250, y: 100),
                                          initialHeading: 0,
                                          colors: [
                                            "0" : LSColor(hue: 275, saturation: 100, brightness: 50, alpha: 100),
                                            "1" : LSColor(hue: 304, saturation: 100, brightness: 100, alpha: 100),
                                            "2" : LSColor(hue: 0, saturation: 94, brightness: 47, alpha: 100),
                                            "3" : LSColor(hue: 0, saturation: 94, brightness: 92, alpha: 100)
                                          ])
        
        // Render the system
        visualizedFlower.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
