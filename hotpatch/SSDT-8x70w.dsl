// SSDT for 8x70w

DefinitionBlock("", "SSDT", 2, "hack", "_8x70w", 0)
{
    #define OVERRIDE_IGPI Ones
    #define OVERRIDE_DGPU 0
    #include "SSDT-RMCF.asl"
    #include "SSDT-PEGP_GFX0_RDSS.asl"
    #include "SSDT-HACK.asl"
    #include "include/IDT_7605_HDEF.asl"
    #include "include/standard_PS2K.asl"
    #include "SSDT-KEY87.asl"
    #include "SSDT-USB-8x70.asl"
    #include "SSDT-EH01.asl"
    #include "SSDT-EH02.asl"
    #include "SSDT-XHC.asl"
    #include "SSDT-BATT.asl"
    #include "SSDT-USBX.asl"
}
//EOF
