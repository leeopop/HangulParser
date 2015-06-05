%{
#include "token.h"
%}

%option noyywrap

KEY_CHUN [/]
KEY_JI [\*]
KEY_IN [-]
KEY_FLUSH [3]
KEY_DOT [1]
KEY_GA_KA [7]
KEY_NA_RA [8]
KEY_DA_TA [9]
KEY_BA_PA [4]
KEY_SA_HA [5]
KEY_JA_CHA [6]
KEY_A_MA [2]

ENTER [\n\r]

GA {KEY_GA_KA}
NA {KEY_NA_RA}
DA {KEY_DA_TA}
RA {KEY_NA_RA}{KEY_NA_RA}
MA {KEY_A_MA}{KEY_A_MA}
BA {KEY_BA_PA}
SA {KEY_SA_HA}
A {KEY_A_MA}
JA {KEY_JA_CHA}
CHA {KEY_JA_CHA}{KEY_JA_CHA}
KA {KEY_GA_KA}{KEY_GA_KA}
TA {KEY_DA_TA}{KEY_DA_TA}
PA {KEY_BA_PA}{KEY_BA_PA}
HA {KEY_SA_HA}{KEY_SA_HA}
KKA {KEY_GA_KA}{KEY_GA_KA}{KEY_GA_KA}
DDA {KEY_DA_TA}{KEY_DA_TA}{KEY_DA_TA}
PPA {KEY_BA_PA}{KEY_BA_PA}{KEY_BA_PA}
SSA {KEY_SA_HA}{KEY_SA_HA}{KEY_SA_HA}
JJA {KEY_JA_CHA}{KEY_JA_CHA}{KEY_JA_CHA}

CHOSUNG {GA}|{NA}|{DA}|{RA}|{MA}|{BA}|{SA}|{A}|{JA}|{CHA}|{KA}|{TA}|{PA}|{HA}|{KKA}|{DDA}|{PPA}|{SSA}|{JJA}



MOUM_A {KEY_IN}{KEY_CHUN}
YA {KEY_IN}{KEY_CHUN}{KEY_CHUN}
EO {KEY_CHUN}{KEY_IN}
YEO {KEY_CHUN}{KEY_IN}{KEY_IN}
O {KEY_CHUN}{KEY_JI}
YO {KEY_CHUN}{KEY_CHUN}{KEY_JI}
U {KEY_JI}{KEY_CHUN}
YU {KEY_JI}{KEY_CHUN}{KEY_CHUN}
EU {KEY_JI}
I {KEY_IN}
WA {KEY_CHUN}{KEY_JI}{KEY_IN}{KEY_CHUN}
WO {KEY_JI}{KEY_CHUN}{KEY_CHUN}{KEY_IN}
WAE {KEY_CHUN}{KEY_JI}{KEY_IN}{KEY_CHUN}{KEY_IN}
WE {KEY_JI}{KEY_CHUN}{KEY_CHUN}{KEY_IN}{KEY_IN}
AE {KEY_IN}{KEY_CHUN}{KEY_IN}
YAE {KEY_IN}{KEY_CHUN}{KEY_CHUN}{KEY_IN}
E {KEY_CHUN}{KEY_IN}{KEY_IN}
YE {KEY_CHUN}{KEY_CHUN}{KEY_IN}{KEY_IN}
OE {KEY_CHUN}{KEY_JI}{KEY_IN}
WI {KEY_JI}{KEY_CHUN}{KEY_IN}
UI {KEY_JI}{KEY_IN}

JUNGSUNG {MOUM_A}|{YA}|{EO}|{YEO}|{O}|{YO}|{U}|{YU}|{EU}|{I}|{WA}|{WO}|{WAE}|{WE}|{AE}|{YAE}|{E}|{YE}|{OE}|{WI}|{UI}

GUSU {GA}{SA}
NUJU {NA}{JA}
RUGU {RA}{GA}
MUGU {MA}{GA}
BUSU {BA}{SA}
NUHU {NA}{HA}

RUMU {RA}{MA}
RUSU {RA}{SA}
RUTU {RA}{TA}
RUPU {RA}{PA}
RUHU {RA}{HA}

JONGSUNG_BOKYONG_CHOSUNG {GUSU}|{NUJU}|{RUGU}|{MUGU}|{BUSU}|{NUHU}|{RUMU}|{RUSU}|{RUTU}|{RUPU}|{RUHU}

BATCHIM {GA}|{NA}|{DA}|{RA}|{MA}|{BA}|{SA}|{A}|{JA}|{CHA}|{KA}|{TA}|{PA}|{HA}|{KKA}|{SSA}|{JONGSUNG_BOKYONG_CHOSUNG}

JAUM_7 {GA}|{NA}|{DA}|{BA}|{SA}|{JA}|{A}
MOUM_3 {KEY_CHUN}|{KEY_JI}|{KEY_IN}
SIGMA {JAUM_7}|{MOUM_3}

%x state_S
%x state_Moum
%x state_Moum_c
%x state_Moum_cc
%x state_Moum_cci

%%


<*>{ENTER}	{ return FLUSH; }

%%
