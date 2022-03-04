
TITLE PUMP
: Sodium potassium pump -- Canavier, 1999
: 

UNITS {
	(molar) = (1/liter)
        (pA) = (picoamp)
	(mV) =	(millivolt)
        (uS) = (micromho)
	(mA) =	(milliamp)
	(mM) =	(millimolar)   
}

INDEPENDENT {v FROM -100 TO 50 WITH 50 (mV)}


NEURON {
   SUFFIX pump	
   USEION na READ nai WRITE ina
   USEION k WRITE ik 
   RANGE pumpbar, km, n, inapump, ikpump, kpumpleak, napumpleak : electroneutral sodium accumulation
}



PARAMETER {
	  dt (ms)
    km0 = 1   (mM)
    kout = 5    (mM)   
    km1 = 6.7   (mM)
    km2 = 20	(mM)
   pumpbar = 0.1   (mA/cm2)  
   napumpleak = 0 (mA/cm2) 
   kpumpleak = 0 (mA/cm2) 
   nai (mM)
   n = 1.5
   q10 = 3
}


ASSIGNED{
	ina 	(mA/cm2)
	ik 	(mA/cm2)
	inapump  (mA/cm2)
	ikpump (mA/cm2)
  qt
}


INITIAL {

inapump = pumpbar*(1/(1+exp((68-nai)/1)))
ina = 3.0*inapump
ik = -2.0*inapump
ikpump = ik

kpumpleak = ik
napumpleak = ina
qt = q10^((celsius-6)/10)

}

BREAKPOINT {

inapump = qt * pumpbar*(1/(1+exp((68-nai)/1)))
ina = (3.0*inapump) - napumpleak
ik = (-2.0*inapump) - kpumpleak
ikpump = ik

}

