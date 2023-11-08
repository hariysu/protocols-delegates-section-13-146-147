//
//  main.swift
//  Protocols-Delegates-Section-13
//
//  Created by Abdurahman on 6.11.2023.
//


protocol AdvancedLifeSupport {
    func performCPR()
}

//UITextField
class EmergencyCallHandler{
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

//It can be delegate
struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

//It can be delegate
class Doctor: AdvancedLifeSupport{
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    func useStethescope(){
        print("Listening for heart sounds")
    }
}

//It can be delegate
class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    func useElectricDrill(){
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()


