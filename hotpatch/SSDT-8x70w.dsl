// SSDT for 8x70w

DefinitionBlock ("", "SSDT", 2, "hack", "8x70w", 0)
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

    External(_SB.PCI0.PEGP.GFX0, DeviceObj)
    Scope(_SB.PCI0.PEGP.GFX0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03
                })
            }

            Return (Package (0x1C)
            {
                "AAPL,backlight-control",
                Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x00
                },

                "@0,backlight-control",
                Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x00
                },

                "@0,built-in",
                Buffer (One)
                {
                    0x01
                },

                "@0,compatible",
                Buffer (0x0B)
                {
                    "NVDA,NVMac"
                },

                "@0,connector-type",
                Buffer (0x04)
                {
                    0x00, 0x08, 0x00, 0x00
                },

                "@1,connector-type",
                Buffer (0x04)
                {
                    0x00, 0x08, 0x00, 0x00
                },

                "@2,connector-type",
                Buffer (0x04)
                {
                    0x00, 0x08, 0x00, 0x00
                },

                "@3,connector-type",
                Buffer (0x04)
                {
                    0x00, 0x08, 0x00, 0x00
                },

                "@0,device_type",
                Buffer (0x08)
                {
                    "display"
                },

                "@0,display-cfg",
                Buffer (0x04)
                {
                    0xFF, 0xFF, 0x36, 0x00
                },

                "@0,display-type",
                Buffer (0x04)
                {
                    "LCD"
                },

                "@0,name",
                Buffer (0x0F)
                {
                    "NVDA,Display-A"
                },

                "@0,pwm-info",
                Buffer (0x14)
                {
                    /* 0000 */  0x01, 0x14, 0x00, 0x64, 0xA8, 0x61, 0x00, 0x00,
                    /* 0008 */  0x08, 0x52, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
                    /* 0010 */  0x00, 0x04, 0x00, 0x00
                },
                // Buffer (0x18)
                // {
                //    /* 0000 */  0x02, 0x18, 0x00, 0x64, 0x90, 0x59, 0x02, 0x00,
                //    /* 0008 */  0x08, 0x52, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00,
                //    /* 0010 */  0x00, 0x04, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
                // },

                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

}
//EOF
