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
   0|  0.81| 99.19|  4002||40832559|1885004||  0.00|  3.66| 95.56
   8| 13.35| 86.65|  4113||40832559|1885004||  0.00| 10.55| 76.12
   1|  0.01| 99.99|  3899||40832559|1885004||  0.00|  0.65| 99.33
   9|  0.25| 99.75|  4076||40832559|1885004||  0.03|  0.74| 99.01
   2| 23.53| 76.47|  4084||40832559|1885004||  0.00| 31.74| 44.83
  10|  9.18| 90.82|  4130||40832559|1885004||  0.01|  7.01| 83.85
   3|  0.18| 99.82|  4016||40832559|1885004||  0.00|  1.17| 98.66
  11|  0.19| 99.81|  4187||40832559|1885004||  0.00|  0.39| 99.42
   4| 21.09| 78.91|  4092||40832559|1885004||  0.05| 18.16| 60.78
  12|  8.01| 91.99|  4168||40832559|1885004||  0.00|  1.64| 90.37
   5|  0.12| 99.88|  4018||40832559|1885004||  0.00|  0.68| 99.20
  13|  0.13| 99.87|  4158||40832559|1885004||  0.00|  0.00| 99.86
   6| 14.89| 85.11|  4079||40832559|1885004||  0.00| 13.56| 71.60
  14|  6.86| 93.14|  4191||40832559|1885004||  0.00|  1.81| 91.34
   7|  0.25| 99.75|  4175||40832559|1885004||  0.00|  0.24| 99.51
  15|  0.37| 99.63|  4011||40832559|1885004||  0.00|  2.57| 97.10
```

As you can see, I'm now averaging 4.15Ghz instead of my stock 3.8Ghz.

#### Thanks for reading!