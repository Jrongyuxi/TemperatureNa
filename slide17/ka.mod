TITLE ka
: From Traub & Miles "Neuronal networks of the hippocampus" (1991)
: Cummins et al. (2007), Sheets et al. (2007)

NEURON {
	SUFFIX ka
	USEION k READ ek WRITE ik
	RANGE gkabar, m, h, ik, q10
	GLOBAL inf,tau
}

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)
}

PARAMETER {
	v (mV)
	celsius		(degC)
	gkabar= .300 	(mho/cm2)
	ek 		(mV)
	q10=3

}
STATE {
	m h
}
ASSIGNED {
	ik (mA/cm2)
	inf[2]
        tau[2]
        qt
        
}

INITIAL {
         mhn(v)
         m=inf[0]
         h=inf[1]
         qt = q10^((celsius-6)/10)
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	ik = qt * gkabar*m*m*m*h*(v - ek)
}

DERIVATIVE states {	
	mhn(v*1(mV))
	
	m' = (inf[0] - m)/tau[0]
	h' = (inf[1] - h)/tau[1]
}


PROCEDURE mhn(v) {

	tau[0]= (18+ 58/(1+exp((v+61)/20)))/qt
	tau[1]= 50/qt
	inf[0]= 1/(1+exp(-(v+80)/30))
	inf[1]= 1/(1+exp((v+80)/8))
}
