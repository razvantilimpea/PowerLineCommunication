/*
 * Copyright (c) 2013 - 2015, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "fsl_debug_console.h"
#include "board.h"
#include "fsl_pdb.h"
#include "fsl_dac.h"

#include "pin_mux.h"
#include "clock_config.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
#define DEMO_PDB_BASE PDB0
#define DEMO_PDB_IRQ_ID PDB0_IRQn
#define DEMO_PDB_DELAY_VALUE 1000U
#define DEMO_PDB_MODULUS_VALUE 1000U
#define DEMO_PDB_DAC_INTERVAL_VALUE 15U

#define DEMO_DAC_BASE DAC0
#define DEMO_DAC_CHANNEL 0U
#define DEMO_ADC_CHANNEL 0U
#define DEMO_DAC_IRQ_ID DAC0_IRQn
#define DEMO_DAC_USED_BUFFER_SIZE DAC_DATL_COUNT

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
/*!
 * @brief Initialize the DAC.
 */

static void DEMO_InitPDB_DAC(void);

/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile uint32_t g_PdbDelayInterruptCounter;
volatile uint32_t g_PdbDelayInterruptFlag;
#if defined(FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION) && FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION
volatile bool g_DacBufferWatermarkInterruptFlag;
#endif /* FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION */
volatile bool g_DacBufferReadPointerTopPositionInterruptFlag;
volatile bool g_DacBufferReadPointerBottomPositionInterruptFlag;

/*******************************************************************************
 * Code
 ******************************************************************************/
void static DEMO_InitPDB_DAC(void)
{
    dac_config_t dacConfigStruct;
    dac_buffer_config_t dacBufferConfigStruct;
    uint8_t index = 0U;
    uint16_t dacValue[16];
    uint32_t mask;

    /* Configure the DAC. */
    /*
     * dacConfigStruct.referenceVoltageSource = kDAC_ReferenceVoltageSourceVref2;
     * dacConfigStruct.enableLowPowerMode = false;
     */
    DAC_GetDefaultConfig(&dacConfigStruct);
    DAC_Init(DEMO_DAC_BASE, &dacConfigStruct);

    /* Configure the DAC buffer. */
    dacConfigStruct.referenceVoltageSource = kDAC_ReferenceVoltageSourceVref1;
    DAC_GetDefaultBufferConfig(&dacBufferConfigStruct);
    dacBufferConfigStruct.triggerMode = kDAC_BufferTriggerByHardwareMode;
    DAC_SetBufferConfig(DEMO_DAC_BASE, &dacBufferConfigStruct);
    dacValue[0]=1000<<1;
    dacValue[1]=1382<<1;
    dacValue[2]=1707<<1;
    dacValue[3]=1923<<1;
    dacValue[4]=2000<<1;
    dacValue[5]=1923<<1;
    dacValue[6]=1707<<1;
    dacValue[7]=1382<<1;
    dacValue[8]=1000<<1;
    dacValue[9]=617<<1;
    dacValue[10]=292<<1;
    dacValue[11]=76<<1;
    dacValue[12]=0<<1;
    dacValue[13]=76<<1;
    dacValue[14]=292<<1;
    dacValue[15]=617<<1;

    /* Make sure the read pointer to the start. */
    DAC_SetBufferReadPointer(DEMO_DAC_BASE, 0U);
    for (index = 0U; index < DEMO_DAC_USED_BUFFER_SIZE; index++)
    {
        DAC_SetBufferValue(DEMO_DAC_BASE, index, dacValue[index]);
    }
/* Clear flags. */
#if defined(FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION) && FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION
    g_DacBufferWatermarkInterruptFlag = false;
#endif /* FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION */
    g_DacBufferReadPointerTopPositionInterruptFlag = false;
    g_DacBufferReadPointerBottomPositionInterruptFlag = false;

    /* Enable interrupts. */
    mask = 0U;
#if defined(FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION) && FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION
    mask |= kDAC_BufferWatermarkInterruptEnable;
#endif /* FSL_FEATURE_DAC_HAS_WATERMARK_SELECTION */
    mask |= kDAC_BufferReadPointerTopInterruptEnable | kDAC_BufferReadPointerBottomInterruptEnable;
    DAC_EnableBuffer(DEMO_DAC_BASE, true);
    DAC_EnableBufferInterrupts(DEMO_DAC_BASE, mask);

}

/*!
 * @brief Main function
 */
void sendData(bool* data, uint8_t size)
{
	uint8_t i = 0;
	uint8_t prag = 0;
	DAC_Type* base;
	base = DAC0;
	base->C0 = base->C0 | DAC_C0_DACEN_MASK;
	 while (i <= size)
	    {
		 	 if((base->C2>>DAC_C2_DACBFRP_SHIFT) == prag)
		 	 {
	    		if (data[i] == 0)
	    		{
	    			DAC_SetBufferReadPointer(DEMO_DAC_BASE, 0U);
	    			prag = 15;
	    		}
	    		else
	    		{
	    			DAC_SetBufferReadPointer(DEMO_DAC_BASE, 8U);
	    			prag = 7;
	    		}
	    		i++;
	    		while(((base->C2>>DAC_C2_DACBFRP_SHIFT) == prag)){}
		 	 }
	    }
	base->C0 = base->C0 & (~DAC_C0_DACEN_MASK);
}
static uint16_t coeff;
void Goertzel(uint16_t* data, uint32_t* Q1_final, uint32_t* Q2_final)
{
	uint16_t i;
	uint32_t Q0 = 0;
	uint32_t Q1 = 0;
	uint32_t Q2 = 0;
	for (i=0;i<16;i++)
	{
		Q0 = coeff*coeff - Q2 + data[i];
		Q2 = Q1;
		Q1 = Q0;
	}
}

int main(void)
{
    pdb_config_t pdbConfigStruct;
    pdb_dac_trigger_config_t pdbDacTriggerConfigStruct;
    uint8_t index = 0U;
    DAC_Type* base;
    base = DAC0;
    BOARD_InitPins();
    BOARD_BootClockHSRUN();
    BOARD_InitDebugConsole();
    //EnableIRQ(DEMO_PDB_IRQ_ID);
    //EnableIRQ(DEMO_DAC_IRQ_ID);

    PRINTF("\r\nPDB DAC trigger Example.\r\n");

    /* Configure the PDB counter. */
    /*
     * pdbConfigStruct.loadValueMode = kPDB_LoadValueImmediately;
     * pdbConfigStruct.prescalerDivider = kPDB_PrescalerDivider1;
     * pdbConfigStruct.dividerMultiplicationFactor = kPDB_DividerMultiplicationFactor1;
     * pdbConfigStruct.triggerInputSource = kPDB_TriggerSoftware;
     * pdbConfigStruct.enableContinuousMode = false;
     */

    PDB_GetDefaultConfig(&pdbConfigStruct);
    pdbConfigStruct.enableContinuousMode = true;
    PDB_Init(DEMO_PDB_BASE, &pdbConfigStruct);

    /* Configure the delay interrupt. */
    PDB_SetModulusValue(DEMO_PDB_BASE, DEMO_PDB_MODULUS_VALUE);
    PDB_SetCounterDelayValue(DEMO_PDB_BASE, DEMO_PDB_DELAY_VALUE);
    PDB_EnableInterrupts(DEMO_PDB_BASE, kPDB_DelayInterruptEnable);

    /* Configure the DAC trigger. */
    pdbDacTriggerConfigStruct.enableExternalTriggerInput = false;
    pdbDacTriggerConfigStruct.enableIntervalTrigger = true;
    PDB_SetDACTriggerConfig(DEMO_PDB_BASE, DEMO_DAC_CHANNEL, &pdbDacTriggerConfigStruct);
    PDB_SetDACTriggerIntervalValue(DEMO_PDB_BASE, DEMO_DAC_CHANNEL, DEMO_PDB_DAC_INTERVAL_VALUE);
    PDB_SetDACTriggerConfig(DEMO_PDB_BASE, DEMO_ADC_CHANNEL, &pdbDacTriggerConfigStruct);
    PDB_SetDACTriggerIntervalValue(DEMO_PDB_BASE, DEMO_ADC_CHANNEL, DEMO_PDB_DAC_INTERVAL_VALUE);

    /* Configure the DAC. */
    DEMO_InitPDB_DAC();
    PDB_DoLoadValues(DEMO_PDB_BASE);
    PDB_DoSoftwareTrigger(DEMO_PDB_BASE);
    bool data[10] ={0, 0, 1, 1, 0, 0, 1, 1, 1, 1};
    uint16_t i;

    uint8_t ptrIndex = 0;
    sendData(data,10);
    while(1){}
}
