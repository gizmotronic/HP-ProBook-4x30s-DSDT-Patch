#!/bin/bash

#set -x

if [[ "$1" == "" ]]; then
    echo "Usage: ./install_acpi.sh [model] [fanpref]"
    echo "Use ./install_acpi.sh help for a listing of supported models."
    echo "fanpref is default to READ (other: Q, RM, ORIG, GRAP)"
    exit
fi

if [[ "$1" == "help" ]]; then
    grep -o install_.*\) $0 | grep -v grep | tr ')' ' '
    exit
fi

EFI="$(./mount_efi.sh)"
#EFI=./EFI
BUILDDIR=./build

source install_acpi_include.sh

if [[ "$2" != "" ]]; then
    FANPREF=$2
else
    FANPREF=READ
fi

case "$1" in
# helpers
    inst_lores)
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/DSDT.aml
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/SSDT-*.aml
        #cp $CORE "$EFI"/EFI/CLOVER/ACPI/patched
        cp $BUILDDIR/SSDT-IGPU.aml "$EFI"/EFI/CLOVER/ACPI/patched
        cp $BUILDDIR/SSDT-FAN$FANPREF.aml "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    inst_hires)
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/DSDT.aml
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/SSDT-*.aml
        #cp $CORE "$EFI"/EFI/CLOVER/ACPI/patched
        cp $BUILDDIR/SSDT-IGPUH.aml "$EFI"/EFI/CLOVER/ACPI/patched
        cp $BUILDDIR/SSDT-FAN$FANPREF.aml "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    inst_dgfx)
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/DSDT.aml
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/SSDT-*.aml
        #cp $CORE "$EFI"/EFI/CLOVER/ACPI/patched
        cp $BUILDDIR/SSDT-FAN$FANPREF.aml "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    inst_xcpm)
        $0 inst_lores $2
        # Haswell/Broadwell/Skylake/KabyLake all use XCPM only for CPU PM
        rm -f "$EFI"/EFI/CLOVER/ACPI/patched/SSDT.aml
    ;;
# model specific scripts
    install_4x30)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-4x30.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x30_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-4x30.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x30)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-4230.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x40)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-4x40.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x40_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-4x40.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_6x60)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-6x60.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    # 2x60 is very similar to 6x60 (but uses KEY102)
    install_2x60)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-6x60.aml "$EFI"/EFI/CLOVER/ACPI/patched/SSDT-2x60.aml
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_6x60_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-6x60.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x60)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-8x60.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x60_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-8x60.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_5x30)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-5x30.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_5x30_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-5x30.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_2x70)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-2x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_2x70_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-2x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_6x70)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-6x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_6x70_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-6x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x70)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-8x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x70_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-8x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x70w)
        $0 inst_dgfx $2
        cp $BUILDDIR/SSDT-8x70w.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_9x70)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-9x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_9x70_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-9x70.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_9x80)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-9x80.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g0)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-4x0G0.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g0_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-4x0G0.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_3x0g1)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-3x0G1.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_3x0g1_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-3x0G1.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g1_ivy)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-4x0G1i.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g1_ivy_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-4x0G1i.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g1_ivy)
        $0 inst_lores $2
        cp $BUILDDIR/SSDT-8x0G1i.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g1_ivy_hires)
        $0 inst_hires $2
        cp $BUILDDIR/SSDT-8x0G1i.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g1_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-4x0G1h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_450g1_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-450G1h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_6x0g1_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-6x0G1h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g1_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-8x0G1h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_1040g1_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-1040G1h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_1040g3_skylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-1040G3s.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_1050g1_kabylake-r)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-1050G1k.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g2_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-4x0G2h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g2_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-8x0G2h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g2_broadwell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-4x0G2b.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g2_broadwell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-8x0G2b.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g3_broadwell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-8x0G3b.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_1020g1_broadwell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-1020G1b.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_ZBook_G2_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-zbG2h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_ZBook_G2_haswell_alc280)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-zbG2hA.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_ZBook_G1_haswell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-zbG1h.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_ZBook_G2_broadwell)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-zbG2b.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_ZBook_G3_skylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-zbG3s.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g3_skylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-4x0G3s.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g3_skylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-8x0G3s.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_1030g1_skylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-1030G1s.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_6x0g2_skylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-6x0G2s.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g4_kabylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-4x0G4k.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_8x0g4_kabylake)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-8x0G4k.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;
    install_4x0g5_kabylake-r)
        $0 inst_xcpm $2
        cp $BUILDDIR/SSDT-4x0G4k.aml "$EFI"/EFI/CLOVER/ACPI/patched
        ls "$EFI"/EFI/CLOVER/ACPI/patched
    ;;

# unknown models
    *)
        echo "Error: Unknown model, \"$1\", specifed."
    ;;
esac

#EOF
