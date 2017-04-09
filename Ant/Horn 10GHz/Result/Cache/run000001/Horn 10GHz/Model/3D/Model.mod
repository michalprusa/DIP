'# MWS Version: Version 2016.0 - Jan 22 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = frequency_centre*0.8 fmax = frequency_centre*1.2


'@ new component: Horn

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Component.New "Horn"

'@ use template: Antenna (Horn, Waveguide)

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
' Template for Antenna in Free Space
' ==================================
' (CSTxMWSxONLY)
' draw the bounding box
Plot.DrawBox True
' set units to mm, ghz
With Units 
     .Geometry "mm"
     .Frequency "ghz"
     .Time "ns" 
End With 
' set background material to vacuum
With Background 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
End With 
' set boundary conditions to open
With Boundary
     .Xmin "expanded open" 
     .Xmax "expanded open" 
     .Ymin "expanded open" 
     .Ymax "expanded open" 
     .Zmin "expanded open" 
     .Zmax "expanded open" 
     .Xsymmetry "none" 
     .Ysymmetry "none" 
     .Zsymmetry "none" 
End With
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True" 
Mesh.FPBAAvoidNonRegUnite "True" 
Mesh.ConsiderSpaceForLowerMeshLimit "False" 
Mesh.MinimumStepNumber "5"

'@ define brick: Horn:waveguide

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Brick
     .Reset 
     .Name "waveguide" 
     .Component "Horn" 
     .Material "PEC" 
     .Xrange "-waveguide_width/2", "waveguide_width/2" 
     .Yrange "-waveguide_height/2", "waveguide_height/2" 
     .Zrange "0", "waveguide_length" 
     .Create
End With

'@ pick face

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Horn:waveguide", "1"

'@ align wcs with face

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
WCS.AlignWCSWithSelectedFace 
Pick.PickCenterpointFromId "Horn:waveguide", "1" 
WCS.AlignWCSWithSelectedPoint

'@ new curve: aperture

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Curve.NewCurve "aperture"

'@ move wcs

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
WCS.MoveWCS "local", "0.0", "0.0", "flare_length"

'@ define curve rectangle: aperture:aperture

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Rectangle
     .Reset 
     .Name "aperture" 
     .Curve "aperture" 
     .Xrange "-aperture_width/2", "aperture_width/2" 
     .Yrange "-aperture_height/2", "aperture_height/2" 
     .Create
End With

'@ define coverprofile: Horn:solid1

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With CoverCurve
     .Reset 
     .Name "solid1" 
     .Component "Horn" 
     .Material "PEC" 
     .Curve "aperture:aperture" 
     .Create
End With

'@ pick face

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Horn:waveguide", "1"

'@ pick face

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Horn:solid1", "1"

'@ define loft: Horn:solid2

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Loft 
     .Reset 
     .Name "flare" 
     .Component "Horn" 
     .Material "PEC" 
     .Tangency "0.0" 
     .CreateNew 
End With

'@ delete shape: Horn:solid1

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Solid.Delete "Horn:solid1"

'@ boolean add shapes: Horn:flare, Horn:waveguide

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Solid.Add "Horn:flare", "Horn:waveguide"

'@ pick face

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Horn:flare", "8"

'@ pick face

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Pick.PickFaceFromId "Horn:flare", "2"

'@ shell object: Horn:flare

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Solid.ShellAdvanced "Horn:flare", "Outside", "metal_thickness", "True"

'@ pick edge

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Pick.PickEdgeFromId "Horn:flare", "8", "8"

'@ pick edge

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Pick.PickEdgeFromId "Horn:flare", "7", "7"

'@ pick edge

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Pick.PickEdgeFromId "Horn:flare", "5", "5"

'@ pick edge

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Pick.PickEdgeFromId "Horn:flare", "6", "6"

'@ define port: 1

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .NumberOfModes "1" 
     .AdjustPolarization False 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.766855", "11.766855" 
     .Yrange "-5.883425", "5.883425" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ define farfield monitor: farfield (f=frequency_centre)

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (f=frequency_centre)" 
     .Domain "Frequency" 
     .FieldType "Farfield" 
	    .Frequency "frequency_centre" 
     .Create 
End With

'@ define background

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Background 
     .Reset 
     .Type "Normal" 
     .Epsilon "1.0" 
     .Mue "1.0" 
     .ThermalType "Normal" 
     .ThermalConductivity "0.0" 
     .HeatCapacity "0.0" 
     .Rho "0.0" 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With

'@ define pml specials

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Boundary
     .SetPMLType "ConvPML" 
     .Layer "4" 
     .Reflection "0.0001" 
     .Progression "parabolic" 
     .MinimumLinesDistance "5" 
     .MinimumDistancePerWavelength "8" 
     .ActivePMLFactor "1.0" 
     .FrequencyForMinimumDistance "0.75" 
     .MinimumDistanceAtCenterFrequency "True" 
     .SetConvPMLKMax "5.0" 
     .SetConvPMLExponentM "3" 
End With

'@ define frequency range

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Solver.FrequencyRange "frequency_centre*0.8", "frequency_centre*1.2"

'@ define special solver parameters

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Solver 
     .TimeBetweenUpdates "1200" 
     .NumberOfPulseWidths "20" 
     .EnergyBalanceLimit "0.03" 
     .UseArfilter "False" 
     .ArMaxEnergyDeviation "0.1" 
     .ArPulseSkip "1" 
     .WaveguideBroadband "False" 
     .SetBBPSamples "5" 
     .SetSamplesFullDeembedding "20" 
     .MatrixDump "False" 
     .TimestepReduction "0.45" 
     .NumberOfSubcycles "4" 
     .SubcycleFillLimit "70" 
     .SetSubcycleState "Automatic" 
     .SetSubgridCycleState "Automatic" 
     .SimplifiedPBAMethod "False" 
     .UseParallelization "True" 
     .MaximumNumberOfThreads "16" 
     .TimeStepStabilityFactor "1.0" 
     .UseOpenBoundaryForHigherModes "True" 
     .SetModeFreqFactor "0.5" 
     .SurfaceImpedanceOrder "10" 
     .SetPortShielding "False" 
     .FrequencySamples "1001" 
     .ConsiderTwoPortReciprocity "True" 
     .UseTSTAtPort "True" 
     .SParaAdjustment "True" 
     .RestartAfterInstabilityAbort "True" 
     .HardwareAcceleration "False" 
     .AdaptivePortMeshing "True" 
     .AccuracyAdaptivePortMeshing "1" 
     .PassesAdaptivePortMeshing "4" 
End With

'@ define solver parameters

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S" 
     .StimulationPort "All" 
     .StimulationMode "All" 
     .SteadyStateLimit "-30" 
     .MeshAdaption "False" 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .CalculateModesOnly "False" 
     .SParaSymmetry "False" 
     .StoreTDResultsInCache "False" 
     .FullDeembedding "False" 
     .UseDistributedComputing "False" 
     .DistributeMatrixCalculation "True" 
     .MPIParallelization "False" 
     .SuperimposePLWExcitation "False" 
End With

'@ set pba mesh type

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
Mesh.MeshType "PBA"

'@ set mesh properties

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Mesh 
     .UseRatioLimit "True" 
     .RatioLimit "10" 
     .LinesPerWavelength "10" 
     .MinimumStepNumber "10" 
     .Automesh "True" 
     .MeshType "PBA" 
     .SetCreator "High Frequency" 
End With

'@ define boundaries

'[VERSION]2009.7|18.0.3|20090230[/VERSION]
With Boundary
     .Xmin "expanded open" 
     .Xmax "expanded open" 
     .Ymin "expanded open" 
     .Ymax "expanded open" 
     .Zmin "expanded open" 
     .Zmax "expanded open" 
     .Xsymmetry "magnetic" 
     .Ysymmetry "electric" 
     .Zsymmetry "none" 
     .XminThermal "isothermal" 
     .XmaxThermal "isothermal" 
     .YminThermal "isothermal" 
     .YmaxThermal "isothermal" 
     .ZminThermal "isothermal" 
     .ZmaxThermal "isothermal" 
     .XsymmetryThermal "isothermal" 
     .YsymmetryThermal "isothermal" 
     .ZsymmetryThermal "none" 
     .ApplyInAllDirections "False" 
     .XminTemperature "" 
     .XminTemperatureType "None" 
     .XmaxTemperature "" 
     .XmaxTemperatureType "None" 
     .YminTemperature "" 
     .YminTemperatureType "None" 
     .YmaxTemperature "" 
     .YmaxTemperatureType "None" 
     .ZminTemperature "" 
     .ZminTemperatureType "None" 
     .ZmaxTemperature "" 
     .ZmaxTemperatureType "None" 
End With

'@ set units in materials

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Material.SetUnitInMaterial "portback-PEC", "GHz", "mm"

'@ clear picks

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Pick.ClearAllPicks

'@ define solver parameters

'[VERSION]2010.7|20.0.0|20101029[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
End With

'@ change solver type

'[VERSION]2014.0|23.0.0|20140220[/VERSION]
ChangeSolverType "HF Time Domain"

'@ clear picks

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Pick.ClearAllPicks

'@ define time domain solver parameters

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set mesh properties (Hexahedral)

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With Mesh 
     .MeshType "PBA" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "10" 
     .Set "StepsPerWaveFar", "10" 
     .Set "WavelengthRefinementSameAsNear", "1" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "MaxStepNear", "0" 
     .Set "MaxStepFar", "0" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     .Set "UseMaxStepAbsolute", "0" 
     .Set "GeometryRefinementSameAsNear", "0" 
     'MIN CELL 
     .Set "UseRatioLimitGeometry", "1" 
     .Set "RatioLimitGeometry", "10" 
     .Set "MinStepGeometryX", "0" 
     .Set "MinStepGeometryY", "0" 
     .Set "MinStepGeometryZ", "0" 
     .Set "UseSameMinStepGeometryXYZ", "1" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "FaceRefinementOn", "0" 
     .Set "FaceRefinementPolicy", "2" 
     .Set "FaceRefinementRatio", "2" 
     .Set "FaceRefinementStep", "0" 
     .Set "FaceRefinementNSteps", "2" 
     .Set "EllipseRefinementOn", "0" 
     .Set "EllipseRefinementPolicy", "2" 
     .Set "EllipseRefinementRatio", "2" 
     .Set "EllipseRefinementStep", "0" 
     .Set "EllipseRefinementNSteps", "2" 
     .Set "FaceRefinementBufferLines", "3" 
     .Set "EdgeRefinementOn", "1" 
     .Set "EdgeRefinementPolicy", "1" 
     .Set "EdgeRefinementRatio", "2" 
     .Set "EdgeRefinementStep", "0" 
     .Set "EdgeRefinementBufferLines", "3" 
     .Set "RefineEdgeMaterialGlobal", "0" 
     .Set "RefineAxialEdgeGlobal", "0" 
     .Set "BufferLinesNear", "3" 
     .Set "UseDielectrics", "1" 
     .Set "EquilibrateOn", "0" 
     .Set "Equilibrate", "1.5" 
     .Set "IgnoreThinPanelMaterial", "0" 
End With 
With MeshSettings 
     .SetMeshType "Hex" 
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With 
With Discretizer 
     .MeshType "PBA" 
     .PBAType "Fast PBA" 
     .AutomaticPBAType "True" 
     .FPBAAccuracyEnhancement "enable"
     .ConnectivityCheck "False"
     .ConvertGeometryDataAfterMeshing "True" 
     .UsePecEdgeModel "True" 
     .GapDetection "False" 
     .FPBAGapTolerance "1e-3" 
     .SetMaxParallelMesherThreads "Hex", "12"
     .SetParallelMesherMode "Hex", "Maximum"
     .PointAccEnhancement "0" 
     .UseSplitComponents "True" 
     .EnableSubgridding "False" 
     .PBAFillLimit "99" 
     .AlwaysExcludePec "False" 
End With

'@ change solver type

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
ChangeSolverType "HF Frequency Domain"

'@ set mesh properties (Tetrahedral)

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
With Mesh 
     .MeshType "Tetrahedral" 
     .SetCreator "High Frequency"
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "Version", 1%
     'MAX CELL - WAVELENGTH REFINEMENT 
     .Set "StepsPerWaveNear", "4" 
     .Set "StepsPerWaveFar", "4" 
     .Set "PhaseErrorNear", "0.02" 
     .Set "PhaseErrorFar", "0.02" 
     .Set "CellsPerWavelengthPolicy", "automatic" 
     'MAX CELL - GEOMETRY REFINEMENT 
     .Set "StepsPerBoxNear", "10" 
     .Set "StepsPerBoxFar", "1" 
     .Set "ModelBoxDescrNear", "maxedge" 
     .Set "ModelBoxDescrFar", "maxedge" 
     'MIN CELL 
     .Set "UseRatioLimit", "0" 
     .Set "RatioLimit", "100" 
     .Set "MinStep", "0" 
     'MESHING METHOD 
     .SetMeshType "Unstr" 
     .Set "Method", "0" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "CurvatureOrder", "1" 
     .Set "CurvatureOrderPolicy", "automatic" 
     .Set "CurvRefinementControl", "NormalTolerance" 
     .Set "NormalTolerance", "22.5" 
     .Set "SrfMeshGradation", "2" 
     .Set "SrfMeshOptimization", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseMaterials",  "1" 
End With 
With MeshSettings 
     .SetMeshType "Tet" 
     .Set "UseAnisoCurveRefinement", "1" 
     .Set "UseSameSrfAndVolMeshGradation", "1" 
     .Set "VolMeshGradation", "2" 
     .Set "VolMeshOptimization", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "SmallFeatureSize", "0" 
     .Set "CoincidenceTolerance", "1e-006" 
     .Set "SelfIntersectionCheck", "1" 
End With 
With MeshSettings 
     .SetMeshType "Unstr" 
     .Set "UseDC", "0" 
End With 
With Mesh 
     .SetParallelMesherMode "Tet", "maximum" 
     .SetMaxParallelMesherThreads "Tet", "1" 
End With

'@ define frequency domain solver parameters

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Mesh.SetCreator "High Frequency" 
With FDSolver
     .Reset 
     .SetMethod "Tetrahedral", "General purpose" 
     .OrderTet "Second" 
     .OrderSrf "First" 
     .Stimulation "All", "All" 
     .ResetExcitationList 
     .AutoNormImpedance "False" 
     .NormingImpedance "50" 
     .ModesOnly "False" 
     .ConsiderPortLossesTet "True" 
     .SetShieldAllPorts "False" 
     .AccuracyHex "1e-6" 
     .AccuracyTet "1e-4" 
     .AccuracySrf "1e-3" 
     .LimitIterations "False" 
     .MaxIterations "0" 
     .SetCalculateExcitationsInParallel "True", "False", "" 
     .StoreAllResults "False" 
     .StoreResultsInCache "False" 
     .UseHelmholtzEquation "True" 
     .LowFrequencyStabilization "True" 
     .Type "Auto" 
     .MeshAdaptionHex "False" 
     .MeshAdaptionTet "True" 
     .AcceleratedRestart "True" 
     .FreqDistAdaptMode "Distributed" 
     .NewIterativeSolver "True" 
     .TDCompatibleMaterials "False" 
     .ExtrudeOpenBC "True" 
     .SetOpenBCTypeHex "Default" 
     .SetOpenBCTypeTet "Default" 
     .AddMonitorSamples "True" 
     .CalcStatBField "False" 
     .CalcPowerLoss "True" 
     .CalcPowerLossPerComponent "False" 
     .StoreSolutionCoefficients "True" 
     .UseDoublePrecision "False" 
     .UseDoublePrecision_ML "True" 
     .MixedOrderSrf "False" 
     .MixedOrderTet "False" 
     .PreconditionerAccuracyIntEq "0.15" 
     .MLFMMAccuracy "Default" 
     .MinMLFMMBoxSize "0.20" 
     .UseCFIEForCPECIntEq "true" 
     .UseFastRCSSweepIntEq "false" 
     .UseSensitivityAnalysis "False" 
     .SweepErrorThreshold "True", "0.01" 
     .SweepErrorChecks "2" 
     .SweepMinimumSamples "3" 
     .SweepConsiderAll "True" 
     .SweepConsiderReset 
     .SetNumberOfResultDataSamples "1001" 
     .SweepWeightEvanescent "1.0" 
     .AccuracyROM "1e-4" 
     .AddSampleInterval "", "", "1", "Automatic", "True" 
     .AddSampleInterval "", "", "", "Automatic", "False" 
     .MPIParallelization "False"
     .UseDistributedComputing "False"
     .NetworkComputingStrategy "RunRemote"
     .NetworkComputingJobCount "3"
     .LimitCPUs "True"
     .MaxCPUs "48"
End With
With IESolver
     .Reset 
     .UseFastFrequencySweep "True" 
     .UseIEGroundPlane "False" 
     .PreconditionerType "Auto" 
End With
With IESolver
     .SetFMMFFCalcStopLevel "0" 
     .SetFMMFFCalcNumInterpPoints "6" 
     .UseFMMFarfieldCalc "True" 
     .SetCFIEAlpha "0.500000" 
     .LowFrequencyStabilization "False" 
     .LowFrequencyStabilizationML "True" 
     .Multilayer "False" 
     .SetiMoMACC_I "0.0001" 
     .SetiMoMACC_M "0.0001" 
     .DeembedExternalPorts "True" 
     .SetOpenBC_XY "True" 
     .OldRCSSweepDefintion "False" 
     .SetAccuracySetting "Custom" 
End With

'@ change solver type

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
ChangeSolverType "HF Time Domain"

''@ set mesh properties (Hexahedral)
'
''[VERSION]2014.6|23.0.0|20141128[/VERSION]
'With Mesh 
'     .MeshType "PBA" 
'     .SetCreator "High Frequency"
'End With 
'With MeshSettings 
'     .SetMeshType "Hex" 
'     .Set "Version", 1%
'     'MAX CELL - WAVELENGTH REFINEMENT 
'     .Set "StepsPerWaveNear", "10" 
'     .Set "StepsPerWaveFar", "10" 
'     .Set "WavelengthRefinementSameAsNear", "1" 
'     'MAX CELL - GEOMETRY REFINEMENT 
'     .Set "StepsPerBoxNear", "10" 
'     .Set "StepsPerBoxFar", "1" 
'     .Set "MaxStepNear", "0" 
'     .Set "MaxStepFar", "0" 
'     .Set "ModelBoxDescrNear", "maxedge" 
'     .Set "ModelBoxDescrFar", "maxedge" 
'     .Set "UseMaxStepAbsolute", "0" 
'     .Set "GeometryRefinementSameAsNear", "0" 
'     'MIN CELL 
'     .Set "UseRatioLimitGeometry", "1" 
'     .Set "RatioLimitGeometry", "10" 
'     .Set "MinStepGeometryX", "0" 
'     .Set "MinStepGeometryY", "0" 
'     .Set "MinStepGeometryZ", "0" 
'     .Set "UseSameMinStepGeometryXYZ", "1" 
'End With 
'With MeshSettings 
'     .SetMeshType "Hex" 
'     .Set "FaceRefinementOn", "0" 
'     .Set "FaceRefinementPolicy", "2" 
'     .Set "FaceRefinementRatio", "2" 
'     .Set "FaceRefinementStep", "0" 
'     .Set "FaceRefinementNSteps", "2" 
'     .Set "EllipseRefinementOn", "0" 
'     .Set "EllipseRefinementPolicy", "2" 
'     .Set "EllipseRefinementRatio", "2" 
'     .Set "EllipseRefinementStep", "0" 
'     .Set "EllipseRefinementNSteps", "2" 
'     .Set "FaceRefinementBufferLines", "3" 
'     .Set "EdgeRefinementOn", "1" 
'     .Set "EdgeRefinementPolicy", "1" 
'     .Set "EdgeRefinementRatio", "2" 
'     .Set "EdgeRefinementStep", "0" 
'     .Set "EdgeRefinementBufferLines", "3" 
'     .Set "RefineEdgeMaterialGlobal", "0" 
'     .Set "RefineAxialEdgeGlobal", "0" 
'     .Set "BufferLinesNear", "3" 
'     .Set "UseDielectrics", "1" 
'     .Set "EquilibrateOn", "0" 
'     .Set "Equilibrate", "1.5" 
'     .Set "IgnoreThinPanelMaterial", "0" 
'End With 
'With MeshSettings 
'     .SetMeshType "Hex" 
'     .Set "SnapToAxialEdges", "1"
'     .Set "SnapToPlanes", "1"
'     .Set "SnapToSpheres", "1"
'     .Set "SnapToEllipses", "1"
'     .Set "SnapToCylinders", "1"
'     .Set "SnapToCylinderCenters", "1"
'     .Set "SnapToEllipseCenters", "1"
'End With 
'With Discretizer 
'     .MeshType "PBA" 
'     .PBAType "Fast PBA" 
'     .AutomaticPBAType "True" 
'     .FPBAAccuracyEnhancement "enable"
'     .ConnectivityCheck "False"
'     .ConvertGeometryDataAfterMeshing "True" 
'     .UsePecEdgeModel "True" 
'     .GapDetection "False" 
'     .FPBAGapTolerance "1e-3" 
'     .SetMaxParallelMesherThreads "Hex", "12"
'     .SetParallelMesherMode "Hex", "Maximum"
'     .PointAccEnhancement "0" 
'     .UseSplitComponents "True" 
'     .EnableSubgridding "False" 
'     .PBAFillLimit "99" 
'     .AlwaysExcludePec "False" 
'End With
'
''@ define time domain solver parameters
'
''[VERSION]2014.6|23.0.0|20141128[/VERSION]
'Mesh.SetCreator "High Frequency" 
'With Solver 
'     .Method "Hexahedral"
'     .CalculationType "TD-S"
'     .StimulationPort "All"
'     .StimulationMode "All"
'     .SteadyStateLimit "-30"
'     .MeshAdaption "False"
'     .AutoNormImpedance "False"
'     .NormingImpedance "50"
'     .CalculateModesOnly "False"
'     .SParaSymmetry "False"
'     .StoreTDResultsInCache  "False"
'     .FullDeembedding "False"
'     .SuperimposePLWExcitation "False"
'     .UseSensitivityAnalysis "False"
'End With
'
'@ define time domain solver parameters

'[VERSION]2014.6|23.0.0|20141128[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ set parametersweep options

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
    .SetSimulationType "Transient" 
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With

'@ add parsweep parameter: Sequence 1:flare_length

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "flare_length", "228", "108", "10" 
End With

'@ farfield plot options

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With

'@ edit parsweep parameter: Sequence 1:flare_length

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With ParameterSweep
     .DeleteParameter "Sequence 1", "flare_length" 
     .AddParameter_Linear "Sequence 1", "flare_length", "228", "108", "2" 
End With

'@ farfield plot options

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With FarfieldPlot 
     .Plottype "3D" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "5" 
     .Step2 "5" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000" 
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000" 
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+000 
     .Origin "bbox" 
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+000" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+001" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With

'@ define time domain solver parameters

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "True"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ farfield plot options

'[VERSION]2016.0|25.0.2|20160122[/VERSION]
With FarfieldPlot 
     .Plottype "Polar" 
     .Vary "angle1" 
     .Theta "0" 
     .Phi "0" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "False" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "-1" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "True" 
     .SetLogRange "50" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With 


