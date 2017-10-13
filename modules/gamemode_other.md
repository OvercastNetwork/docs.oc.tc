---
layout: page

category: "Modules"
title:  "Other Game Modes"
nav_content:
  - path: "#rage"
    name: "Rage"
  - path: "#tdm"
    name: "Team Deathmatch"
  - path: "#ffa"
    name: "Free-For-All"

---

### Rage {#rage}
Enable the one hit kill, rage style gamemode.

One hit kills will only be applied to items that have a sharpness enchantment greater than level 1. One shot arrow kills will only be applied to bows that have a power enchantment greater than level 1.

`NOTE:` This module must be used in conjunction with another gamemode.

    <rage/>

    <time>8m</time>
    <score>
        <limit>15</limit>
    </score>


<br/>

### Team Death-match {#tdm}
This gamemode uses the [scoring](/modules/scoring) module to run the game for a specified amount of time, after which the team with the highest score wins. Teams increase their score by killing players from the other team or capturing points from a [score box](/modules/scoring#score_box).

`NOTE:` To be able to score points for kills and deaths the `<kills>` and `<deaths>` elements are required.

    <score>
        <kills>1</kills>    <!-- +1 points for a kill -->
        <deaths>1</deaths>  <!-- -1 points for dying -->
    </score>

    <!-- Time till the match ends in seconds (10 minutes) -->
    <time>600</time>


<br/>

### Free-For-All {#ffa}
The FFA gamemode uses the [players](/modules/players) instead of the [teams](/modules/teams) module to create a team-less match.
Depending on the modules used, players can increase their score by killing other players until a score or time limit is reached or by capturing objectives, etc.

`NOTE:` To be able to score points for kills and deaths the `<kills>` and `<deaths>` elements are required.

    <players max="16" max-overfill="20"/>
    <time>8m</time>

    <score>
        <kills>1</kills>
        <deaths>1</deaths>
    </score>
