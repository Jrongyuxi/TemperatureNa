

COMMENT
Longitudinal diffusion and integration of sodium (no buffering)
(equivalent modified euler with standard method and
equivalent to diagonalized linear solver with CVODE )
From Canavier et al. 1999
ENDCOMMENT

NEURON {
   SUFFIX nadifl
   USEION na READ ina WRITE nai
   RANGE D
}

UNITS {
   (molar) = (1/liter)
   (mM) = (millimolar)
   (um) = (micron)
   FARADAY = (faraday) (coulomb)
   PI = (pi) (1)
}

PARAMETER {
   D = .6 (um2/ms)
}

ASSIGNED {
   ina (mA/cm2)
   ik (mA/cm2)
   diam (um)
}


INITIAL {
     nai = 65
}

STATE {
   nai (mM)
}

BREAKPOINT {
   SOLVE conc METHOD sparse
}

KINETIC conc {
   COMPARTMENT PI*diam*diam/4 {nai}
   LONGITUDINAL_DIFFUSION D*diam*diam/4  {nai}
   ~ nai << (-ina/(FARADAY)*PI*diam*(1e4))
}

