---
layout: page

category: "Modules"
title:  "Lanes"

---

Lanes are used in RFW style maps with two parallel lanes for the teams. They prevent players from leaving their teams lane and entering the enemies.
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
            <code>{{'<lanes> </lanes>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing this world's lanes.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<lane> </lane>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single lane definition.
        </td>
        <td>
          <a href='/modules/regions'>Regions</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Lane Attributes</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Attribute</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <code>team</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          The team the lane belongs to and in which they have to stay inside.
        </td>
        <td>
          <a href='/modules/teams'>Team ID</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <lanes>
        <lane team="blue">
            <region id="blue-lane-total"/>
            <region id="blue-spawn-rooms"/>
        </lane>
        <lane team="red">
            <region id="red-lane-total"/>
            <region id="red-spawn-rooms"/>
        </lane>
    </lanes>
