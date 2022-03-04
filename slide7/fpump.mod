
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
   RANGE pumpbar, km, n, inapump : electroneutral sodium accumulation
}



PARAMETER {
	  dt (ms)
    km0 = 1   (mM)
    kout = 5    (mM)   
    km1 = 6.7   (mM)
    km2 = 20	(mM)
   pumpbar = 0.1   (mA/cm2)  
   nai (mM)
   n = 1.5
   q10 = 1.5
}


ASSIGNED{
	ina 	(mA/cm2)
	ik 	(mA/cm2)
	inapump  (mA/cm2)
  qt
}


INITIAL {

qt = q10^((celsius-6)/10)
inapump = pumpbar*(1/(1+pow(km1/nai,n)))
ina = 3.0*inapump
ik = -2.0*inapump


}

BREAKPOINT {

inapump = qt * pumpbar*(1/(1+pow(km1/nai,n)))
ina = (3.0*inapump)
ik = (-2.0*inapump)


}

