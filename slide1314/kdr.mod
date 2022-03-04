TITLE Borg-Graham type generic K-DR channel
: Borg-Graham 1987

UNITS {
	(mA) = (milliamp)
	(mV) = (millivolt)

}

PARAMETER {
	v (mV)
        ek		 (mV)
	celsius		(degC)
	gkdrbar=.003 (mho/cm2)
	q10_g = 1.5
	q10 = 3
}


NEURON {
	SUFFIX borgkdr
	USEION k READ ek WRITE ik
        RANGE gkdrbar,gkdr, ik,q10
        GLOBAL taum
}

STATE {
	m
}

ASSIGNED {
	ik (mA/cm2)
        minf    
        gkdr
        taum
        qt
        qt_g
}

INITIAL {
        rates(v)
        m=minf
        qt = q10^((celsius-6)/10)
        qt_g = q10_g^((celsius-6)/10)
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	gkdr = qt_g * gkdrbar*m^4
	ik = gkdr*(v-ek)

}


DERIVATIVE states {  
        rates(v)
        
        m' = (minf - m)/taum
}

PROCEDURE rates(v (mV)) { :callable from hoc
		
		
        minf = 1/(1+exp(-(v+40)/15))
        taum = 10/(cosh((v+40)/15))/qt
}







