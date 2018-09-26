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

            Return (Package (0x34)
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

                "AAPL,aux-power-connected",
                Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x00
                },

                "@0,AAPL,boot-display",
                Buffer (One)
                {
                     0x01
                },

                "@0,display-cfg",
                Buffer (0x04)
                {
                     0xFF, 0xFF, 0x36, 0x00
                },

                "@1,display-cfg",
                Buffer (0x04)
                {
                     0xFF, 0xFF, 0xFF, 0xFF
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

                "@0,built-in",
                Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x01
                },

                "@0,use-backlight-blanking",
                Buffer (0x04) {},
                "AAPL,gray-page",
                Buffer (0x04)
                {
                     0x01, 0x00, 0x00, 0x00
                },

                "AAPL00,inverter",
                Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                },

                "@1,can-hot-plug",
                Buffer (0x04) {},
                "AAPL00,blackscreen.preferences",
                Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x08
                },

                "AAPL01,blackscreen.preferences",
                Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x08
                },

                "@0,pwm-info",
                Buffer (0x18)
                {
                    /* 0000 */  0x02, 0x18, 0x00, 0x64, 0x90, 0x59, 0x02, 0x00,
                    /* 0008 */  0x08, 0x52, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00,
                    /* 0010 */  0x00, 0x04, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
                },

                "@0,NVMT",
                Buffer (0x70)
                {
                    /* 0000 */  0x0E, 0x03, 0x7F, 0x20, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */  0x40, 0x0B, 0x08, 0x07, 0xE0, 0x0B, 0x70, 0x0B,
                    /* 0010 */  0x90, 0x0B, 0x00, 0x00, 0x3C, 0x07, 0x0B, 0x07,
                    /* 0018 */  0x11, 0x07, 0x00, 0x00, 0xF0, 0xA7, 0x21, 0x14,
                    /* 0020 */  0x00, 0x00, 0x00, 0x01, 0xAF, 0x00, 0x00, 0x00,
                    /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0030 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0040 */  0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00,
                    /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0050 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF,
                    /* 0058 */  0x00, 0x00, 0x00, 0x00, 0xBC, 0x02, 0x01, 0x5A,
                    /* 0060 */  0x0A, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00,
                    /* 0068 */  0x40, 0x0B, 0x08, 0x07, 0x40, 0x0B, 0x08, 0x07
                },

                "NVPM",
                Buffer (0x1C)
                {
                    /* 0000 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0018 */  0x00, 0x00, 0x00, 0x00
                },

                "@0,compatible",
                Buffer (0x0B)
                {
                    "NVDA,NVMac"
                },

                "@0,device_type",
                Buffer (0x08)
                {
                    "display"
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

                "@1,compatible",
                Buffer (0x0B)
                {
                    "NVDA,NVMac"
                },

                "@1,device_type",
                Buffer (0x08)
                {
                    "display"
                },

                "@1,name",
                Buffer (0x0F)
                {
                    "NVDA,Display-B"
                },

                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

    // For backlight control
    Device(_SB.PCI0.PEGP.GFX0.PNLF)
    {
        Name(_ADR, Zero)
        Name(_HID, EisaId ("APP0002"))
        Name(_CID, "backlight")
        Name(_UID, 0x0A)
        Name(_STA, 0x0B)
    }

}
//EOF
