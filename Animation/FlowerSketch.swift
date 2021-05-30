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
        var flowerSystem = LindenmayerSystem(axiom: "L", rules: [
            "L": [Successor(odds: 1, text: "0[F--F+F--F+F--F+F--F+F--F+F--F]1[--F++F--f--F++F--f--F++F--f--F]")],
        ],
        generations: 1)
        
        
        
        // Visualize the system
        var visualizedFlower = Visualizer(for: flowerSystem,
                                          on: canvas,
                                          length: 40,
                                          reduction: 3,
                                          angle: 60,
                                          initialPosition: Point(x: 100, y: 100),
                                          initialHeading: 0,
                                          colors: [
                                            "0" : LSColor(hue: 275, saturation: 100, brightness: 50, alpha: 100),
                                            "1" : LSColor(hue: 304, saturation: 100, brightness: 100, alpha: 100),
                                          ])
        
        // Render the system
        visualizedFlower.render()
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
        
        // Nothing is being animated, so nothing needed here
        
    }
    
}
