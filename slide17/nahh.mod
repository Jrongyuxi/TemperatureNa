TITLE nahh 
: From Traub & Miles "Neuronal networks of the hippocampus" (1991)
: Cummins et al. (2007), Sheets et al. (2007)

NEURON {
	SUFFIX nahh
	USEION na READ ena WRITE ina
	RANGE gnabar, m, h, ishift, mshift, ina,q10
	GLOBAL inf,tau
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	v (mV)
	celsius		(degC)
	gnabar= .300 	(mho/cm2)
	ena 		(mV)
	q10_g = 3
	q10_m = 3
	q10_h = 3
}

STATE {
	m h
}

ASSIGNED {
	ina (mA/cm2)
	inf[2]
        tau[2]
        qt_g
        qt_m
        qt_h
        
}

INITIAL {
         mhn(v)
         m=inf[0]
         h=inf[1]
         qt_g = q10_g^((celsius-6)/10)
         qt_m = q10_m^((celsius-6)/10)
         qt_h = q10_h^((celsius-6)/10)
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	ina = qt_g * gnabar*m*m*m*h*(v - ena)
}

DERIVATIVE states {	
	mhn(v*1(mV))
	
	m' = (inf[0] - m)/tau[0]
	h' = (inf[1] - h)/tau[1]
}


PROCEDURE mhn(v) {

	tau[0]= (0.6/(cosh((v+27)/7.5)))/qt_m
	tau[1]= 40/(cosh((v+42)/15))/qt_h
	inf[0]= 1/(1+exp(-(v+28)/8.5))
	inf[1]= 1/(1+exp((v+60)/15))
}

