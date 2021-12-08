//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Stored properties
    // Whatever the user adds to the text field
    @State var providedRadius = ""
        
    // MARK: Computed properties
    // Check the input given by the user
    // If possible, return a Double
    // Otherwise (bad input) return nil
    var radius: Double? {
        
        // Tests of the provided input
        // 1. Ensure that we can simply change the input into a Double
        // 2. Ensure that the value as a Double is more than 0
        // With a "guard" statement, we list the things we wish to be
        // true... and provide an action to carry out when those
        // conditions are not met.
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            // When the tests are failed, we do not have a valid radius
            return nil
        }
        
        // If we get here, we know the radius is good
        return radius
        
    }
    
    // Attempts to calculate the area, if it can't... returns nil
    var area: Double? {
        
        // Is the input actually a Double, or... is it Double? (might be nil)
        guard let radius = radius
        else {
            // We didn't have a valid radius
            // We can't calcualte the area...
            return nil
        }
        
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                TextField("Radius",
                          text: $providedRadius,
                          prompt: Text("Numeric value greater than 0"))
                
                // Output: Radius
                SliderValueView(value: radius)
                
                SectionLabelView(text: "Area", variable: "")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Circle")
        .padding()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CircleView()
        }
    }
}
