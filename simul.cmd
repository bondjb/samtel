File {
    Grid = "start_txstr_msh.tdr"
    Current = "start_txstr_def.plt"
    Plot = "start_txstr_def.tdr"
    Output = "start_txstr_def.log"
}

Electrode {
    {   Name = "Drain_contact"
        Voltage = 1.8   }
    {   Name = "Source_contact"
        Voltage = 0.0   }
    {   Name = "Gate_contact"
        Voltage = 0.0   }
    {   Name = "Body_contact"
        Voltage = 0.0   }
}

Physics {
    Mobility( DopingDep HighFieldSat Enormal )
    EffectiveIntrinsicDensity( OldSlotBoom )
}

Plot {
    eDensity hDensity eCurrent hCurrent
    Potential SpaceCharge ElectricField
    eMobility hMobility eVelocity hVelocity
    Doping DonorConcentration AcceptorConcentration
}

Math {
    Extrapolate
    RelErrControl
    Iteration = 50
    Notdamped = 100
}

Solve {
    Coupled (Iterations = 100) { Poisson }
    Coupled { Poisson Electron Hole }
    
    QuasiStationary(
        InitialStep = 0.001
        Increment = 1.1
        MinStep = 1e-5
        MaxStep = 0.05
        Goal {
            Name = "Gate_contact"
            Voltage = 1.8
        }
    ) { Coupled { Poisson Electron Hole }}
}

