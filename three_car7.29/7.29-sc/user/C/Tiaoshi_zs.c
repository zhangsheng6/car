#include "Tiaoshi_zs.h"
#include "Variable.h"
#include "common.h"
#include "allHead.h"

void man_zs(void)
{
  if(speed_L>20||speed_R>20)
    man=2;
}

void Back_Car()

{
   if(man>1)
   {
     if(AD_inductor[0]<1&&AD_inductor[1]<1&&AD_inductor[2]<1)
     {

        change_L(0);
  change_R(0);
     }
   }
}