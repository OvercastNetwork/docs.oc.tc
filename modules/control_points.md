---
layout: page

category: "Modules"
title:  "Control Points"

---

Control point give a certain amount of point to the team currently holding it. Once a team has captured all points, or reached a certain score (using the [score module](/modules/scoring)) the match ends. Control points can be mixed with and used in addition to other gamemodes. Other uses of control points include unlocking an area of the map using objective filters, etc.

    <control-points capture-players="lead" incremental="true" show-progress="true">
        <control-point name="Center" capture-time="20s">
            <capture><cylinder base="0.5,23,7.5" radius="7" height="5"/></capture>
            <progress><cylinder base="0.5,22,7.5" radius="7" height="4"/></progress>
            <captured><cylinder base="0.5,64,7.5" radius="7" height="5"/></captured>
        </control-point>
    </control-points>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 300px;'>Control Points Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<control-points> </control-points>' | escape_once}}</code>
          </span>
        </td>
        <td colspan='2'>Node containing a single control point or a group of control points.</td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<control-point> </control-point>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single control point.
        </td>
        <td>
          <span class='label label-default'>Control Point Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Control Point Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 150px;'>Attribute</th>
        <th>Description</th>
        <th style='min-width: 100px;'>Value</th>
        <th>Default</th>
        <th>KotH</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>id</code>
        </td>
        <td>Unique identifier used to reference control points from other places in the XML.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>name</code>
        </td>
        <td>
          Name of the control point, displayed on the scoreboard.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>required</code>
        </td>
        <td>
          Specify if this objective is required to win the match.
          <br/>
          Teams completing all of their required objectives will win regardless of score or blitz configuration.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td colspan='2'>
          true
        </td>
      </tr>
      <tr>
        <td>
          <code>capture-time</code>
        </td>
        <td>
          Time to capture the control point.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td colspan='2'>30 sec</td>
      </tr>
      <tr>
        <td>
          <code>points</code>
        </td>
        <td>
          Points to give per second to the owning team.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td colspan='2'>1</td>
      </tr>
      <tr>
        <td>
          <code>points-growth</code>
        </td>
        <td>
          Number of seconds for the point rate to double.
          If given, the rate at which the control point gives points
          will exponential increase with time.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>owner-points</code>
        </td>
        <td>
          Amount of points given to the team that owns the point, they are removed when the team looses the point.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>capture-rule</code>
        </td>
        <td>
          Rule used to decide who is in control of the point at any given moment.
        </td>
        <td>
          <a href='#capture_rule'>Capture Rule</a>
        </td>
        <td colspan='2'>
          exclusive
        </td>
      </tr>
      <tr>
        <td>
          <code>time-multiplier</code>
        </td>
        <td>
          Adjust capture time relative to the amount of team players on the control point.
        </td>
        <td>
          <span class='label label-primary'>Decimal</span>
        </td>
        <td>
          0
        </td>
        <td>
          0.1
        </td>
      </tr>
      <tr>
        <td>
          <code>show-progress</code>
        </td>
        <td>
          Show capture percentage in the sidebar.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          false
        </td>
        <td>
          true
        </td>
      </tr>
      <tr>
        <td>
          <code>neutral-state</code>
        </td>
        <td>
          Control point must be un-captured before it can be captured again.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          false
        </td>
        <td>
          true
        </td>
      </tr>
      <tr>
        <td>
          <code>incremental</code>
        </td>
        <td>
          <span class='label label-warning' title='This attribute should no longer be used.'>Deprecated</span>
          Capture progress is retained even if capturing is interrupted.
          <br/>
          <i>Has been replaced with the recovery & decay attributes which allow much more control over progress.</i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          false
        </td>
        <td>
          true
        </td>
      </tr>
      <tr>
        <td>
          <code>recovery</code>
        </td>
        <td>
          Capture progress recovery, rate at which progress reverts from players dominating the point.
          <br/>
          Can not be combined with the <code>incremental</code> attribute.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          oo
        </td>
        <td>
          1
        </td>
      </tr>
      <tr>
        <td>
          <code>decay</code>
        </td>
        <td>
          Capture progress decay, rate at which progress reverts while nobody is dominating the point.
          <br/>
          Can not be combined with the <code>incremental</code> attribute.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          oo
        </td>
        <td>
          0
        </td>
      </tr>
      <tr>
        <td>
          <code>permanent</code>
        </td>
        <td>
          Control point can only be captured once during the match.
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td>
          false
        </td>
        <td>
          true
        </td>
      </tr>
      <tr>
        <td>
          <code>initial-owner</code>
        </td>
        <td>
          The team owning the control point when the match starts.
        </td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>show</code>
        </td>
        <td>
          Show the objective in the interface and fire fireworks on completion.
          <br/>
          <i>Hidden goals do not count towards a players completed objectives & do not give raindrops.</i>
        </td>
        <td>
          <span class='label label-primary'>true/false</span>
        </td>
        <td colspan='2'>true</td>
      </tr>
      <tr>
        <td>
          <code>visual-materials</code>
        </td>
        <td>
          Filter the materials modified when updating the progress regions.
          <br/>
          <i>Defaults to wool, carpet, stained clay, stained glass & stained glass panes.</i>
        </td>
        <td>
          <a href='/modules/filters'>Block Filter</a>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>capture</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          Region where this control point can be captured.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>progress</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Region where this control points progress is displayed.
        </td>
        <td>
          <a href='/modules/regions'>Bounded Region</a>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>captured</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Region where this control points owner is displayed.
        </td>
        <td>
          <a href='/modules/regions'>Bounded Region</a>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>capture-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter teams that can capture this control point, defaults to all teams. Teams that don't match this filter can still prevent other teams from capturing by standing on the control point. They can also uncapture the control point if neutral-state is enabled.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td colspan='2'></td>
      </tr>
      <tr>
        <td>
          <code>player-filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter players who can control this control point. Players who don't match this filter cannot affect the control point in any way.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td colspan='2'></td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Control Point Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 160px;'>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<capture>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          The region players have to stand in to capture the control point.
        </td>
        <td>
          <a href='/modules/regions'>Regions</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<progress>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          The region to display capture progress.
        </td>
        <td>
          <a href='/modules/regions'>Bounded Regions</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<captured>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          The region to display if the control point is captured.
        </td>
        <td>
          <a href='/modules/regions'>Bounded Regions</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<capture-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter teams that can capture this control point, defaults to all teams. Teams that don't match this filter can still prevent other teams from capturing by standing on the control point. They can also uncapture the control point if neutral-state is enabled.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<player-filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter players who can control this control point. Players who don't match this filter cannot affect the control point in any way.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>

#### Capture Rule {#capture_rule}
The capture rule defines the logic used to decide which team is in control of the point. Values for `capture-rule` can be one of the following:

* `exclusive` The team must be the only team with players on the control point. (default)
* `majority` The team must have more players on the control point than all other teams combined.
* `lead` The team must have more players on the control point than any other single team.

Players who match either `capture-filter` or `player-filter` are counted when calculating the `capture-rule`. Players who don't match either filter cannot affect the control point at all.

<br/>

#### Control Point Regions

Capture progress is displayed inside the defined `<progress>` region using the dominating teams color. After a control point is captured the `<captured>` region is also filled with that color. The progress and captured regions must be bounded regions, e.g. cylinders & cuboids will work, circles and squares will not. Only the default visual materials or materials defined in `visual-materials` will be modified in the progress regions when they are updated.
