#include "Motor_Control.h"

//���
float Motor_Out_L = 0.0, Motor_Out_R = 0.0, Motor_Max = 9000;
unsigned int DEAD_L = 1700; //2120
unsigned int DEAD_R = 2000;  //2120
extern  float Speed_Control_Output_L,Speed_Control_Output_R;
/**
  * ���
  *     ������Ƴ���
  * ��ע
  *
  */
void Motor_control(void)
{

//    Motor_Out_L = Angle_Out - Direction_Control_Output ;//+ Speed_Control_Output ;
//    Motor_Out_R = Angle_Out + Direction_Control_Output ;//+ Speed_Control_Output ;  
 
//    Motor_Out_L = Angle_Out  + Speed_Control_Output_L ;
//    Motor_Out_R = Angle_Out  + Speed_Control_Output_R ;  
    Motor_Out_L = Angle_Out  + Speed_Control_Output;
    Motor_Out_R = Angle_Out  + Speed_Control_Output ; 
    
//            Motor_Out_L = Angle_Out  ;
//    Motor_Out_R = Angle_Out   ; 
          
    /* �������PWM���� ------------------------------------------------------- */
    //��������
    if (Motor_Out_L > 0)
    {
        Motor_Out_L += DEAD_L; //������������
        if (Motor_Out_L > Motor_Max)
            Motor_Out_L = Motor_Max;
    }
    else if (Motor_Out_L < 0)
    {
        Motor_Out_L -= DEAD_L;
        if (Motor_Out_L < -Motor_Max)
            Motor_Out_L = -Motor_Max;
    }

    //�ҵ������
    if (Motor_Out_R > 0)
    {
        Motor_Out_R += DEAD_R;
        if (Motor_Out_R > Motor_Max)
            Motor_Out_R = Motor_Max;
    }
    else if (Motor_Out_R < 0)
    {
        Motor_Out_R -= DEAD_R;
        if (Motor_Out_R < -Motor_Max)
            Motor_Out_R = -Motor_Max;
    }
    /* �������PWM���� -------- END ------------------------------------------ */


        /* �������ת���� -------------------------------------------- */
        //������ת����
        if (Motor_Out_L > 0)
        {
            forward_L;//��ת
        }
        else
        {
            Motor_Out_L = -Motor_Out_L;
            reversal_L;//��ת
        }

        //������ת����
        if (Motor_Out_R > 0)
        {
            forward_R;
        }
        else
        {
            Motor_Out_R = -Motor_Out_R;
            reversal_R;
        }
        /* �������ת���� -------- END ------------------------------- */

        if(car_angle>=80)
        {
        change_L((uint32)Motor_Out_L);
        change_R((uint32)Motor_Out_R);
        }
        else
        {
        change_L(0);
        change_R(0);
        }
}
