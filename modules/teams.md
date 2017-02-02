---
layout: page

category: "Modules"
title:  "Teams"

---

This module is used to specify the teams used in the match and what their attributes are.
Matches without teams can be setup with the [players](/modules/players) module.

The soft player limit for each team is set with the `max=""` attribute and the hard limit with `max-overfill`. If max overfill is not explicitly defined the default will be set to 25% over the maximum team size. Players will not be able to join teams once the max overfill team size is reached.

The team's name is specified inside the `<team>` element. The name should be kept as short as possible and not contain "Team", for example, "Azure" and not "Azure Team".
A team's `plural` attribute specifies if the team name is plural, e.g. "Attackers"; PGM will use this to pick appropriate win messages, etc. The `show-name-tags` attribute specifies who can see player name tags, this only applies to players, observers will always see all name tags.

It is common for maps to only have 2 teams, although more are possible it usually just causes confusion.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Teams Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<teams> </teams>' | escape_once}}</code>
          </span>
        </td>
        <td>The teams node, containing all the individual teams.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<team> </team>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single team node containing the teams name.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Team Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 130px;'>Attribute</th>
        <th>Description</th>
        <th style='min-width: 120px;'>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>id</code>
        </td>
        <td>Unique identifier used to reference teams from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>color</code>
        </td>
        <td>The team's display color.</td>
        <td>
          <a href='/reference/formatting#chatColors'>Chat Color Name</a>
        </td>
      </tr>
      <tr>
        <td>
          <code>overhead-color</code>
        </td>
        <td>The color of a player's name tag on this team.</td>
        <td>
          <a href='/reference/formatting#chatColors'>Chat Color Name</a>
        </td>
      </tr>
      <tr>
        <td>
          <code>plural</code>
        </td>
        <td>
          The team's name is plural, used in status messages.
          <br/>
          e.g.,  <code>Defenders win!</code> instead of <code>Defenders wins!</code>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>show-name-tags</code>
        </td>
        <td>
          Specify who can see the name tags of players in this team.
          <br/>
          Accepts:
          <code>true</code>, <code>false</code>, <code>allies</code> or <code>enemies</code>
        </td>
        <td>
          <span class='label label-primary'>Enum</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>min</code>
        </td>
        <td>
          Required amount of players for this team.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>max</code>
        </td>
        <td>
          Maximum players for this team, normal players cannot join the team once it reaches this size.
          <br/>
          <i>Premium players may join over this limit until <code>max-overfill</code> is reached.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>max-overfill</code>
        </td>
        <td>
          Maximum players hard limit for this team, nobody can join the team once this limit is reached.
          <br/>
          <i>Must be greater than the defined <code>max</code>.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <teams>
       <team id="red-team" color="dark red" max="50" max-overfill="70">Red</team>
       <team id="blue-team" color="blue" max="50" max-overfill="70">Blue</team>
    </teams>

The total maximum number of players in the example given above is 100, however, the max overfill will allow up to 140 players. Servers currently have a player limit of 150, so 100 players in total would allow 50 observers, or 10 observers if teams are at max overfill.
