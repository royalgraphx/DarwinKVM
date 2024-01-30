---
layout: default
title: Manual Setup
parent: Host OS Overclocking
nav_order: 1
---

# Finding Available Governors
#### You can use any as you please.

To find what governors are available from your CPU, execute the following ``cat`` command to view CPU information.

```bash
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
```

```bash
conservative ondemand userspace powersave performance schedutil
```

# Applying CPU Governor

As seen in the example output, we have ``performance`` available to us. Let's go ahead and use ``cpupower`` to apply it.

```bash
sudo cpupower frequency-set -g performance
```

# Checking CPU Clock Speeds

We can utilize ``cpupower`` to print out information about our speeds.

```bash
sudo cpupower monitor
```

```s
    | Mperf              || RAPL        || Idle_Stats         
 CPU| C0   | Cx   | Freq  || pack | core  || POLL | C1   | C2    
   0|  0.79| 99.21|  4136||44464207|1176026||  0.00|  0.44| 98.80
   8|  0.05| 99.95|  4189||44464207|1176026||  0.00|  0.84| 99.13
   1| 28.09| 71.91|  4196||44464207|1176026||  0.01|  0.69| 71.29
   9|  0.88| 99.12|  4246||44464207|1176026||  0.00|  0.04| 99.13
   2| 23.87| 76.13|  4222||44464207|1176026||  0.00|  0.64| 75.58
  10|  0.79| 99.21|  4249||44464207|1176026||  0.00|  0.00| 99.25
   3| 19.94| 80.06|  4217||44464207|1176026||  0.00|  1.17| 78.95
  11|  0.72| 99.28|  4248||44464207|1176026||  0.00|  0.01| 99.31
   4| 16.99| 83.01|  4172||44464207|1176026||  0.00|  0.85| 82.16
  12|  0.63| 99.37|  4217||44464207|1176026||  0.00|  0.00| 99.41
   5| 13.35| 86.65|  4181||44464207|1176026||  0.00|  0.43| 86.22
  13|  0.60| 99.40|  4227||44464207|1176026||  0.00|  0.02| 99.41
   6| 11.63| 88.37|  4178||44464207|1176026||  0.00|  0.42| 87.95
  14|  0.48| 99.52|  4225||44464207|1176026||  0.00|  0.00| 99.56
   7| 11.01| 88.99|  4179||44464207|1176026||  0.00|  0.08| 88.97
  15|  0.63| 99.37|  4211||44464207|1176026||  0.00|  0.02| 99.36
```

As you can see, I'm now averaging 4.15Ghz instead of my stock 3.8Ghz.

#### Thanks for reading!
