//
//  LengthViewController.swift
//  Calu
//
//  Created by Thong Doan on 30/11/2021.
//

import UIKit
import iOSDropDown
class LengthViewController: UIViewController {

    @IBOutlet weak var unitInput: DropDown!
    @IBOutlet weak var unitInputSymbolLb: UILabel!
    @IBOutlet weak var unitOutputSymbolLb: UILabel!
    @IBOutlet weak var unitOutput: DropDown!
    
    
    
   
    
    var arrUnit = [Units(unitName: "Megameters", unitSymbol: UnitLength.megameters.symbol, unit: UnitLength.megameters),
                       Units(unitName: "Kilometers", unitSymbol: UnitLength.kilometers.symbol, unit: UnitLength.kilometers),
                       Units(unitName: "Hectometers", unitSymbol: UnitLength.hectometers.symbol, unit: UnitLength.hectometers),
                       Units(unitName: "Decameters", unitSymbol: UnitLength.decameters.symbol , unit: UnitLength.decameters),
                       Units(unitName: "Meters", unitSymbol: UnitLength.meters.symbol, unit: UnitLength.meters),
                       Units(unitName: "Decimeters", unitSymbol: UnitLength.decimeters.symbol, unit: UnitLength.decimeters),
                       Units(unitName: "Centimeters", unitSymbol: UnitLength.centimeters.symbol, unit: UnitLength.centimeters),
                       Units(unitName: "Millimeters", unitSymbol: UnitLength.millimeters.symbol, unit: UnitLength.millimeters),
                       Units(unitName: "Micrometers", unitSymbol: UnitLength.micrometers.symbol, unit: UnitLength.micrometers),
                       Units(unitName: "Nanometers", unitSymbol: UnitLength.nanometers.symbol, unit: UnitLength.nanometers),
                       Units(unitName: "Picometers", unitSymbol: UnitLength.picometers.symbol, unit: UnitLength.picometers),
                        Units(unitName: "Inches", unitSymbol: UnitLength.inches.symbol, unit: UnitLength.inches),
                        Units(unitName: "Feet", unitSymbol: UnitLength.feet.symbol, unit: UnitLength.feet),
                        Units(unitName: "Yards", unitSymbol: UnitLength.yards.symbol, unit: UnitLength.yards),
                        Units(unitName: "Miles", unitSymbol: UnitLength.miles.symbol, unit: UnitLength.miles),
                        Units(unitName: "Scandinavian Miles", unitSymbol: UnitLength.scandinavianMiles.symbol, unit: UnitLength.scandinavianMiles),
                        Units(unitName: "Light Years", unitSymbol: UnitLength.lightyears.symbol, unit: UnitLength.lightyears),
                        Units(unitName: "Nautical Miles", unitSymbol: UnitLength.nauticalMiles.symbol, unit: UnitLength.nauticalMiles),
                        Units(unitName: "Fathoms", unitSymbol: UnitLength.fathoms.symbol, unit: UnitLength.fathoms),
                        Units(unitName: "Furlongs", unitSymbol: UnitLength.furlongs.symbol, unit: UnitLength.furlongs),
                        Units(unitName: "Astronomical Units", unitSymbol: UnitLength.astronomicalUnits.symbol, unit: UnitLength.astronomicalUnits),
                        Units(unitName: "Parsecs", unitSymbol: UnitLength.parsecs.symbol, unit: UnitLength.parsecs)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        for unit in arrUnit {
            unitInput.optionArray.append(unit.unitName)
            unitOutput.optionArray.append(unit.unitName)
            print(unit.unitName)
        }
        // The list of array to display. Can be changed dynamically
//        unitInput.optionArray = ["Option 1", "Option 2", "Option 3"]
        //Its Id Values and its optional
//        unitInput.optionIds = [1,23,54,22]
        
        let meters = Measurement(value: 5, unit: UnitLength.meters) // 5.0 m
        let kilometers = Measurement(value: 1, unit: UnitLength.kilometers) // 1.0 km
        let result = meters + kilometers
        let finalKilometers = result.converted(to: .kilometers) // 1.005 km
        let finalMeters = result.converted(to: .meters) // 1005.0 m
        let finalMiles = result.converted(to: .miles) // 0.6224 mi
        let finalScandinavianMiles = result.converted(to: .centimeters)
//        unitInput.hideOptionsWhenSelect = false
//        print(meters)
//        print(result)
//        print(kilometers)
//        print(finalKilometers)
//        print(finalMeters)
//        print(finalScandinavianMiles)
        // Image Array its optional
        // The the Closure returns Selected Index and String
        unitInput.didSelect{(selectedText , index ,id) in
            self.unitInputSymbolLb.text =  self.convertUnitNameToUnitSymbol(selectedText)
        }
        unitOutput.didSelect{(selectedText , index ,id) in

            self.unitOutputSymbolLb.text =  self.convertUnitNameToUnitSymbol(selectedText)
        }
//        // Do any additional setup after loading the view.
    }
    
    func convertUnitNameToUnitSymbol(_ unitName: String) -> String {
        var result = ""
        for unit in arrUnit {
            if unitName == unit.unitName {
                result = unit.unitSymbol
            }
        }
        return result
    }
    func convertUnit( number: Double, unitInput: String , unitOutput: String) {
        print(number)
        print(unitInput)
        print(unitOutput)
        var input: UnitLength?
        var output: UnitLength?
        for unit in arrUnit {
            if unitInput == unit.unitName {
                input = unit.unit
            }
            if unitOutput == unit.unitName {
                output = unit.unit
            }
        }
        let inp = Measurement(value: number, unit: input!) // 5.0 m
        print(inp)
        let out = Measurement(value: number, unit: output!) // 5.0 m
        print(out)
//        let kilometers = Measurement(value: 1, unit: UnitLength.kilometers) // 1.0 km
//        let result = meters + kilometers
//        let finalKilometers = result.converted(to: .kilometers) // 1.005 km
//        let finalMeters = result.converted(to: .meters) // 1005.0 m
//        let finalMiles = result.converted(to: .miles) // 0.6224 mi
//        let finalScandinavianMiles = result.converted(to: .centimeters)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private var interkedicateCalucation: (n1: Double, unitInput: String , unitOutput: String)?
    @IBAction func numberValueChanged(_ sender: UITextField) {
//            interkedicateCalucation = (n1: sender.text)
        let num = Double(sender.text!)
       
        convertUnit(number: num!, unitInput: unitInput.text!, unitOutput: unitOutput.text!)

    }
    

    

}
