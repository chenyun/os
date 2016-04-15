/*++

Copyright (c) 2012 Minoca Corp. All Rights Reserved

Module Name:

    Input/Output

Abstract:

    This library contains the I/O (Input/Output) functionality of the
    kernel. The I/O library manages devices, connects them to drivers, and
    coordinates exposing their functionality to other kernel components and
    user mode.

Author:

    Evan Green 16-Sep-2012

Environment:

    Kernel

--*/

function build() {
    base_sources = [
        "arb.c",
        "cachedio.c",
        "cstate.c",
        "device.c",
        "devinfo.c",
        "devrem.c",
        "devres.c",
        "driver.c",
        "fileobj.c",
        "filesys.c",
        "flock.c",
        "info.c",
        "init.c",
        "intrface.c",
        "intrupt.c",
        "iobase.c",
        "iohandle.c",
        "irp.c",
        "mount.c",
        "obfs.c",
        "pagecach.c",
        "path.c",
        "perm.c",
        "pipe.c",
        "pminfo.c",
        "power.c",
        "pstate.c",
        "pty.c",
        "pwropt.c",
        "shmemobj.c",
        "socket.c",
        "stream.c",
        "testhook.c",
        "unsocket.c",
        "userio.c"
    ];

    if ((arch == "armv7") || (arch == "armv6")) {
        arch_sources = [
            "armv7/archio.c",
            "armv7/archpm.c"
        ];

    } else if ((arch == "x86") || (arch == "x64")) {
        arch_sources = [
            "x86/archio.c",
            "x86/archpm.c",
            "x86/intelcst.c"
        ];
    }

    lib = {
        "label": "io",
        "inputs": base_sources + arch_sources,
    };

    entries = static_library(lib);
    return entries;
}

return build();