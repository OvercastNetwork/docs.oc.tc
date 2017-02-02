---
layout: page

category: "Modules"
title:  "World Border"

---

The world border module uses the default minecraft world border and allows customization of its size, position and behavior. Only one world border definition can be active at a time.

Attributes for multiple world borders can be applied for all borders by specifying them in the root `<world-borders>` element.
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<world-borders> </world-borders>' | escape_once}}</code>
          </span>
        </td>
        <td>
          Node containing all the defined world borders.
        </td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<world-border>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single world border.
        </td>
        <td>
          <span class='label label-default'>World Border Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>World Borders Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th style='min-width: 150px;'>Attribute</th>
        <th>Description</th>
        <th>Value</th>
        <th>Default</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>center</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The center of this world border.
        </td>
        <td>
          <span class='label label-primary'>X,Z</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>size</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The diameter of the world border, borders are always square.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>when</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter when this world border is in effect.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>after</code>
        </td>
        <td>
          Time after which this border takes effect.
          <br>
          <i>Not compatible with the <code>when</code> property.</i>
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>duration</code>
        </td>
        <td>
          The time it takes to transition from the previous state to this state.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <code>damage</code>
        </td>
        <td>
          Amount of damage per second inflicted to players for each meter they are outside the border.
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>
          0.2
        </td>
      </tr>
      <tr>
        <td>
          <code>buffer</code>
        </td>
        <td>Distance to the edge of the border where damage to the player begins.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>
          5
        </td>
      </tr>
      <tr>
        <td>
          <code>warning-distance</code>
        </td>
        <td>Show red vignette to players closer than this to border.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
        <td>
          5
        </td>
      </tr>
      <tr>
        <td>
          <code>warning-time</code>
        </td>
        <td>Show red vignette to players when the border is moving and will reach them within this time.</td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
        <td>
          15s
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>World Border Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value/Children</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<when>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          Filter when this world border is in effect.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Examples

    <world-borders center="6.5, -36.5">
        <!-- Typical time-based shrinking border. Starts at 200 meters when the match loads. -->
        <!-- After 5 minutes, it starts shrinking, until it is 20 meters wide at 15 minutes. -->
        <world-border size="200"/>
        <world-border size="20" after="5m" duration="10m"/>
    </world-borders>

    <!-- Borders can be controlled with filters (and will update dynamically). This is -->
    <!-- roughly how you would move a deadly border depending on which team controls a hill -->
    <world-borders size="50" damage="20">
        <world-border center="30, 0">
            <when>
                <objective team="red-team">control-point</objective>
            </when>
        </world-border>
        <world-border center="-30, 0">
            <when>
                <objective team="blue-team">control-point</objective>
            </when>
        </world-border>
    </world-borders>
