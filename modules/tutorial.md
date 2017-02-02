---
layout: page

category: "Modules"
title:  "Map Tutorial"

---

The tutorial module is used to create a tutorial for the map. Tutorials are split up into stages which have a message and a teleport position.

Tutorials are intended for players with zero playing experience, thus they should be written as simple as possible, without any abbreviations or acronyms. If abbreviations are used it is recommended that they are explained or written out, e.g. `Capture the Wool (CTW)`

The `tutorial.xml` defines the default messages that will be sent at the beginning and end of the tutorial.

`NOTE:` This file **must** be included.

    <include src="tutorial.xml"/>

<br/>
Tutorial stages contain a message with multiple lines and a teleport. A stage's title shouldn't be too long since it is displayed in the tool-tip of the tutorial item.
The message element can contain multiple lines, color and [formatting codes](/reference/formatting) can be used for fancy text. Message lines are used to insert a hard line break, you can also put all the text into a single `<line>` however you won't have any control over where lines start to wrap.

Teleports are optional, if they are not defined just the message will be displayed for that stage. They can contain [regions](/modules/regions) or [point providers](/modules/regions#pointProviders), it is recommended that you use a point provider to control precisely where the player spawns. If a point is obstructed the player will not be teleported. However, the stage message will still be displayed.

Stages are displayed in the order that they are defined as in the XML.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Tutorial Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<tutorial> </tutorial>' | escape_once}}</code>
          </span>
        </td>
        <td>Node containing all the defined tutorial stages.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<stage> </stage>' | escape_once}}</code>
          </span>
        </td>
        <td>
          A single tutorial stage.
        </td>
        <td>
          <span class='label label-default'>Stage Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Tutorial Stage Attributes</h5>
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
          <code>title</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          Short title for this stage.
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Tutorial Stage Sub-elements</h5>
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
            <code>{{'<message>' | escape_once}}</code>
          </span>
        </td>
        <td>Container for the tutorial message lines.</td>
        <td>
          <code>{{'<line>' | escape_once}}</code>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<line>' | escape_once}}</code>
          </span>
        </td>
        <td>
          The message lines for this stage. Used in
          <code>{{'<message>' | escape_once}}</code>
        </td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<teleport>' | escape_once}}</code>
          </span>
        </td>
        <td>The viewing location for this stage.</td>
        <td>
          <a href='/modules/regions'>Regions</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
    <tutorial>
        <stage title="Capture the Wool">
            <message>
                <line>`rThis map is a `a`lCapture the Wool `r(CTW) map</line>
                <line>The objective is to grab the wool on the other team's side and return it to your base.</line>
            </message>
            <teleport>
                <point yaw="90" pitch="50">44,60,0</point>
            </teleport>
        </stage>
        <!-- next stages -->
    </tutorial>
