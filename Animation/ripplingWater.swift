//
//  ripplingWater.swift
//  Animation
//
//  Created by Mohamed, Ilana on 2021-05-31.
//

import Foundation
import CanvasGraphics

class WaterRippleSketch: NSObject, Sketchable {
    
    
    
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
        
        var WaterRippleSystem = LindenmayerSystem(axiom: "F", rules: [
            
            "F": [Successor(odds: 1, text: """
                                    [F+F+F]

                                    """),
            ],
            
            
        ],
        generations: 5)
        
        
        
        var visualizedWater = Visualizer(for: WaterRippleSystem,
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
        visualizedWater.render()
        
    }
    
    func draw() {
        
        //Runs repeatedly
    }
    
}
