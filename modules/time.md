---
layout: page

category: "Modules"
title:  "Time & Dimension"
nav_content:
  - path: "#time"
    name: "Time"
  - path: "#dimension"
    name: "Dimension"

---

### Time {#time}
Lock the time to what the map was saved with. Change the maps time to midnight and then save it. The time will then remain locked to midnight the whole game through. This can also be accomplished with the `doDaylightCycle` [gamerule](/modules/gamerules).

    <timelock>on</timelock>  <!-- Defaults to off -->

<br/>

### Dimension {#dimension}
Change the dimension the map is played in to `nether`, `normal` or `the end`. The default is `normal`.
This mainly affects the color of the sky and natural mob spawning if it's enabled.

    <dimension>nether</dimension>
