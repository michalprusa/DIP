MWS Result File Version 20150206
size=i:51

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:Export Farfields in ASCII Format.rd0

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:external
lifetime=s:rebuild
result=s:1
files=s:farfield_source_1.ffs

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:Export Farfields As Source.rd0

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:external
lifetime=s:rebuild
result=s:1
files=s:..\Export\Farfield\farfield (f=frequency_centre) [1].txt

type=s:DATA_FOLDER
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:raw_data

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:p1(1)1(1).sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:d1(1)1(1).sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:a1(1)1(1).sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:RefSpectrum_1.sig

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
files=s:World.fid

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:model.gex

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:survivemeshadapt
result=s:1
files=s:PP.fmm

type=s:HIDDENITEM
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:persistent
result=s:0
files=s:MCalcAccess.log

type=s:FOLDER
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:1D Results

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
treepath=s:1D Results\Port Information\Port Modes_pmi\Gamma\1(1)
files=s:Gamma_1(1)_pmi.sig
xlabel=s:Frequency / GHz
title=s:Propergation factor

type=s:XYSIGNAL2
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\i1
files=s:i1(1).sig
xlabel=s:Time / ns
title=s:Time Signals

type=s:XYSIGNAL2
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Port signals\o1,1
files=s:o1(1)1(1).sig
xlabel=s:Time / ns
title=s:Time Signals

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\S-Parameters\S1,1
files=s:cS1(1)1(1).sig
xlabel=s:Frequency / GHz
title=s:S-Parameters

type=s:XYSIGNAL2
subtype=s:balance
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Balance\Balance [1]
files=s:1.bil
xlabel=s:Frequency / GHz
title=s:S-Parameters Balance

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Stimulated
files=s:StimulatedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Outgoing all Ports
files=s:ReflectedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Accepted
files=s:AcceptedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Accepted per Port\Port 1
files=s:AcceptedPower_1(1).sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Energy\Energy [1]
files=s:1.eng
xlabel=s:Time / ns
title=s:Field Energy / dB

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Power\Excitation [1]\Power Radiated
files=s:RadiatedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Efficiencies\Rad. Efficiency [1]
files=s:FarfieldMetaData_1_RadEff.sig
xlabel=s:Frequency / GHz
title=s:Radiation Efficiency

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Efficiencies\Tot. Efficiency [1]
files=s:FarfieldMetaData_1_TotEff.sig
xlabel=s:Frequency / GHz
title=s:Total Efficiency

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\Reference Impedance\ZRef 1(1)
files=s:ZRef1(1).sig
xlabel=s:Frequency / GHz
ylabel=s:Ohm
title=s:Reference Impedance

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:surviveparchange
result=s:1
parametric=s:P
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

type=s:XYSIGNAL2
subtype=s:user
problemclass=s:Low Frequency:4:3
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default_lf.sig
xlabel=s:Time / ns
title=s:Excitation: default

type=s:XYSIGNAL2
subtype=s:user
problemclass=s:High Frequency:0:0
visibility=s:visible
creation=s:internal
lifetime=s:persistent
result=s:0
treepath=s:Excitation Signals\default
files=s:signal_default.sig
xlabel=s:Time / ns
title=s:Excitation: default

type=s:MODE
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\Port Modes\Port1\e1
files=s:Port1_e1.prt

type=s:MODE
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:2D/3D Results\Port Modes\Port1\h1
files=s:Port1_h1.prt

type=s:XYSIGNAL2
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\i1
files=s:i1(1).sig
xlabel=s:Time / ns
title=s:Time Signals

type=s:XYSIGNAL2
subtype=s:time
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Port signals\o1,1
files=s:o1(1)1(1).sig
xlabel=s:Time / ns
title=s:Time Signals

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\S-Parameters\S1,1
files=s:cS1(1)1(1).sig
xlabel=s:Frequency / GHz
title=s:S-Parameters

type=s:XYSIGNAL2
subtype=s:balance
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Balance\Balance [1]
files=s:1.bil
xlabel=s:Frequency / GHz
title=s:S-Parameters Balance

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Stimulated
files=s:StimulatedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Outgoing all Ports
files=s:ReflectedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Accepted
files=s:AcceptedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Accepted per Port\Port 1
files=s:AcceptedPower_1(1).sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:energy
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Energy\Energy [1]
files=s:1.eng
xlabel=s:Time / ns
title=s:Field Energy / dB

type=s:FARFIELD
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:Farfields\farfield (f=frequency_centre) [1]
files=s:farfield (f=frequency_centre)_1.ffm
ylabel=s:farfield (f=frequency_centre) [1]

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Power\Excitation [1]\Power Radiated
files=s:RadiatedPower_1.sig
xlabel=s:Frequency / GHz
ylabel=s:W
title=s:Power in Watt

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Efficiencies\Rad. Efficiency [1]
files=s:FarfieldMetaData_1_RadEff.sig
xlabel=s:Frequency / GHz
title=s:Radiation Efficiency

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Efficiencies\Tot. Efficiency [1]
files=s:FarfieldMetaData_1_TotEff.sig
xlabel=s:Frequency / GHz
title=s:Total Efficiency

type=s:XYSIGNAL2
subtype=s:complex
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\Reference Impedance\ZRef 1(1)
files=s:ZRef1(1).sig
xlabel=s:Frequency / GHz
ylabel=s:Ohm
title=s:Reference Impedance

type=s:FARFIELDPOLAR
subtype=s:farfield polar linear
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:solverstart
result=s:0
treepath=s:Farfields\farfield (f=frequency_centre) [1]\farfield (f=frequency_centre) [1]
files=s:farfield (f=frequency_centre) [1].sig
xlabel=s:Theta / Degree
title=s:Farfield Directivity Abs (Phi=0)

type=s:TABLE
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
treepath=s:Tables\0D Results\Export Farfields As Source
files=s:Export Farfields As Source.rt0
files=s:Export Farfields As Source.rd0

type=s:TABLE
problemclass=s::8:1000
visibility=s:visible
creation=s:internal
lifetime=s:surviveparchange
result=s:1
treepath=s:Tables\0D Results\Export Farfields in ASCII Format
files=s:Export Farfields in ASCII Format.rt0
files=s:Export Farfields in ASCII Format.rd0

type=s:RESULT_0D
problemclass=s::8:1000
visibility=s:hidden
creation=s:internal
lifetime=s:rebuild
result=s:1
treepath=s:1D Results\AutomaticRunInformation
files=s:AutomaticRunInformation

