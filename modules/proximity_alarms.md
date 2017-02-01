---
layout: page

category: "Modules"
title:  "Proximity Alarms"

---

Proximity alarms can be used to alert players when an enemy enters a specified area. Flares will go off around the protected area, with the color of the detected player's team, and all allied players will receive an alert message with sound.

If the `<notify>` subelement is not defined, the proximity-alarm message is sent only to players who _cannot_ be detected, i.e. those who do not match the detection filter. If the `<detect>` attribute is missing no message will be sent, which means that only players who can see or hear the flares will know when the alarm is tripped.

Flares will only be set off if a `flare-radius=""` is defined. If this attribute is missing a message must be specified to alert players. This is how the alarm can be made "silent", so that enemies may not realize that they have been detected.
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
            <code>&lt;proximity-alarms&gt; &lt;/proximity-alarms&gt;</code>
          </span>
        </td>
        <td colspan='2'>Node containing this maps proximity-alarms.</td>
      </tr>
      <tr>
        <th colspan='2'>Sub-elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;proximity-alarm&gt;</code>
          </span>
        </td>
        <td>An individual proximity-alarm node.</td>
        <td>
          <span class='label label-default'>Proximity-alarm Sub-elements</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Proximity-alarm Attributes</h5>
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
          <code>region</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          <span class='label label-danger'>Required</span>
          The region this alarm applies to.
        </td>
        <td>
          <a href='/modules/regions'>Region</a>
        </td>
      </tr>
      <tr>
        <td>
          <code>message</code>
        </td>
        <td>Message to show in chat when a player is detected.</td>
        <td>
          <span class='label label-primary'>String</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>flare-radius</code>
        </td>
        <td>Radius of the circular area to show flares in, centered on the proximity-alarm region.</td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Proximity-alarm Sub-elements</h5>
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
            <code>&lt;region&gt;</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be either this sub-element or an attribute.'>Property</span>
          <span class='label label-danger'>Required</span>
          The region this alarm applies to, treated as a region union.
        </td>
        <td>
          <a href='/modules/regions'>Regions</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;detect&gt;</code>
          </span>
        </td>
        <td>Filter who gets detected by the proximity alarm.</td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>&lt;notify&gt;</code>
          </span>
        </td>
        <td>Filter who gets notified by the proximity alarm.</td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
Example

    <proximity-alarms>
        <proximity-alarm message="Enemy detected at Blue monument!" flare-radius="4">
            <region>
                <cylinder base="27.5,119,-26.5" radius="7.5" height="15"/>
            </region>
            <detect>
                <team>red</team>
            </detect>
        </proximity-alarm>
    </proximity-alarms>
