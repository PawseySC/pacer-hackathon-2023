## How to brick a GPU node

Run it once, and it hangs.
```
> ./brick_the_gpu 200 1
^C
```

Run it a second time, and ~fool on me~ crash the kernel.
```
> ./brick_the_gpu 200 1
terminate called after throwing an instance of 'std::runtime_error'
  what():  /software/projects/pawsey0799/ryan/setonix/software/MVP_gpu_bricking/gpu_bricking/cpp L:30:
        hipMalloc(&zero_d_array, arr_len)
        HIP assertion failed: 'invalid device ordinal'
```
while on the console
```
nid002982 login: amdgpu: Failed to create process VM object
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: 0000 [#1] SMP NOPTI
CPU: 69 PID: 8917 Comm: brick_the_gpu Kdump: loaded Tainted: G        W  OE      5.14.21-150400.24.46_12.0.73-cray_shasta_c #1 SLE15-SP4 (unreleased)
Hardware name: HPE HPE_CRAY_EX235A/HPE CRAY EX235A, BIOS 1.6.2 03-22-2023
RIP: 0010:ida_free+0xc2/0x140
Code: 3e 77 2d 48 d1 ed 4c 0f a3 e5 73 24 48 c7 c6 fe ff ff ff 44 89 e1 48 d3 c6 48 21 f5 75 67 31 f6 48 89 e7 e8 50 10 01 00 eb 4a <4c> 0f a3 20 72 21 48 8b 3c 24 4c 89 ee e8 cc 50 38 00 89 de 48 c7
RSP: 0018:ffffc90023a6bbe0 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000008000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc90023a6bbe0
RBP: 0000000000000000 R08: ffffc90023a6bbe0 R09: 0000000000000009
R10: 0000000000000000 R11: ffffc90023a6bb80 R12: 0000000000000000
R13: 0000000000000292 R14: ffff88812d930000 R15: 0000000000008000
FS:  0000000000000000(0000) GS:ffff88a04f940000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000007d40a001 CR4: 0000000000770ee0
PKRU: 55555554
Call Trace:
 <TASK>
 amdgpu_pasid_free_delayed+0x116/0x1f0 [amdgpu]
 amdgpu_driver_postclose_kms+0x2da/0x330 [amdgpu]
 drm_file_free.part.16+0x1dd/0x230 [drm]
 drm_release+0x69/0xe0 [drm]
 __fput+0x8a/0x240
 task_work_run+0x71/0xb0
 do_exit+0x3a6/0xc10
 do_group_exit+0x3a/0xa0
 get_signal+0x13c/0x820
 ? __send_signal+0x1cc/0x3f0
 arch_do_signal_or_restart+0xb2/0x790
 ? _raw_spin_unlock_irqrestore+0x1a/0x20
 ? do_send_sig_info+0x5c/0x90
 exit_to_user_mode_prepare+0x11a/0x220
 syscall_exit_to_user_mode+0x19/0x60
 do_syscall_64+0x4e/0xc0
 entry_SYSCALL_64_after_hwframe+0x61/0xcb
RIP: 0033:0x154a26d4fcbb
Code: Unable to access opcode bytes at RIP 0x154a26d4fc91.
RSP: 002b:00007fffda904650 EFLAGS: 00000246 ORIG_RAX: 000000000000000e
RAX: 0000000000000000 RBX: 0000000000000006 RCX: 0000154a26d4fcbb
RDX: 0000000000000000 RSI: 00007fffda904650 RDI: 0000000000000002
RBP: 0000154a270ef5e0 R08: 0000000000000000 R09: 00007fffda904650
R10: 0000000000000008 R11: 0000000000000246 R12: 0000557e2eb1ceb0
R13: 00007fffda904f30 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in: rpcsec_gss_krb5(E) auth_rpcgss(E) nfsv4(E) nfs(E) lockd(E) grace(E) mgc(OE) lustre(OE) lmv(OE) mdc(OE) fid(OE) lov(OE) fld(OE) osc(OE) ptlrpc(OE) obdclass(OE) amdgpu(OE) amddrm_ttm_helper(OE) amdttm(OE) amd_sched(OE) amdkcl(OE) drm_kms_helper(E) cfbfillrect(E) syscopyarea(E) cfbimgblt(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) cfbcopyarea(E) msr_safe(OE) intel_rapl_msr(E) intel_rapl_common(E) amd64_edac(E) edac_mce_amd(E) kvm_amd(E) kvm(E) irqbypass(E) rapl(E) efi_pstore(E) k10temp(E) xpmem(OE) bpmcdmod(OE) button(E) drm(E) fb(E) fbdev(E) drm_panel_orientation_quirks(E) backlight(E) ip_tables(E) x_tables(E) overlay(E) loop(E) dvs(OE) dvsipc(OE) dvsipc_lnet(OE) dvsproc(OE) craytrace(OE) dvskatlas(OE) ksocklnd(OE) lnet(OE) crc32_generic(E) libcfs(OE) fuse(E) kfi_cxi(OE) kfabric(OE) cxi_eth(OE) cxi_user(OE) 8021q(E) garp(E) mrp(E) stp(E) llc(E) amd_energy(OE) crc32c_intel(E) aesni_intel(E) crypto_simd(E) cryptd(E) cxi_core(OE) igb(E) i2c_algo_bit(E)
 nvme(E) sbl(OE) dca(E) xhci_pci(E) nvme_core(E) hwmon(E) xhci_hcd(E) usbcore(E) usb_common(E) sunrpc(E) dm_mod(E) iscsi_tcp(E) libiscsi_tcp(E) libiscsi(E) scsi_transport_iscsi(E) sg(E) scsi_mod(E) amd_hsmp(OE) cray_power_management(OE) freemem(OE) efivarfs(E) autofs4(E)
CR2: 0000000000000000
[Firmware Bug]: the BIOS has corrupted hw-PMU resources (MSR c0010200 is 530076)
```



