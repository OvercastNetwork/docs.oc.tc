---
layout: page

category: "Modules"
title:  "Broadcasts"

---

The broadcast module allows you to broadcast a message to all players at any given point in the match.
Inside the broadcast tag you may specify either a `<alert>` or a `<tip>` message tag with an `after=""` attribute. This attribute is required and specifies how long after the match is started the broadcast is shown. <br/>
The text in broadcasts can be formatted by using [formatting codes](/reference/formatting).

<span class="label label-warning">Note!</span>
This module should **only** be used to to show important information that is **specific** and **unique** to the map.
It should not be used to for generic Stratus related messages.

<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Broadcasts Element</th>
        <th>Description</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<broadcasts> </broadcasts>' | escape_once}}</code>
          </span>
        </td>
        <td>An element containing all the defined broadcast messages.</td>
        <td></td>
      </tr>
      <tr>
        <th colspan='2'>Sub-Elements</th>
        <th>Value/Children</th>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<tip> </tip>' | escape_once}}</code>
          </span>
        </td>
        <td>
          This will display a [Tip] message
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<alert> </alert>' | escape_once}}</code>
          </span>
        </td>
        <td>
          This will display an [Alert] message
        </td>
        <td>
          <span class='label label-primary'>Formatted Text</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Message Tag Attributes</h5>
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
          <code>after</code>
        </td>
        <td>
          <span class='label label-danger'>Required</span>
          Duration to wait after the match starts to show the message.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
      </tr>
      <tr>
        <td>
          <code>every</code>
        </td>
        <td>
          After the message is shown repeat it with this duration between messages.
        </td>
        <td>
          <a href='/reference/time_periods'>Time Period</a>
        </td>
      </tr>
      <tr>
        <td>
          <code>count</code>
        </td>
        <td>
          Amount of times the message is repeated.<br/>
          <i>Infinite repetition can be specified by using <code>oo</code> as the duration.</i>
        </td>
        <td>
          <span class='label label-primary'>Number</span>
        </td>
      </tr>
      <tr>
        <td>
          <code>filter</code>
        </td>
        <td>
          <span class='label label-default' title='Can be either this attribute or a sub-element.'>Property</span>
          Filter if the broadcast message is sent after the duration has passed, or if it's skipped.
        </td>
        <td>
          <a href='/modules/filters'>Filter</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>
<h5>Message Tag Sub-elements</h5>
<div class='table-responsive'>
  <table class='table table-striped table-condensed'>
    <thead>
      <tr>
        <th>Element</th>
        <th>Description</th>
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <span class='highlight'>
            <code>{{'<filter>' | escape_once}}</code>
          </span>
        </td>
        <td>
          <span class='label label-default' title='Can be this sub-element or an attribute.'>Property</span>
          Filter if the broadcast message is sent after the duration has passed, or if it's skipped.
        </td>
        <td>
          <a href='/modules/filters'>Filters</a>
        </td>
      </tr>
    </tbody>
  </table>
</div>

Examples

    <broadcasts>
        <tip after="30s">A [Tip] displayed 30 seconds into the match</tip>
        <alert after="5m">An [Alert] displayed after 5 minutes</alert>
        <tip after="10m" count="3">Repeated [Tip] at 10m, 20m, and 30m</tip>
        <tip after="99s" count="oo">Repeated every 99 seconds, forever</tip>
        <tip after="20m" every="1m">Displayed at 20m and every minute after that</tip>
        <tip after="30m" every="10m" count="3">At 30m, 40m, and 50m</tip>
    </broadcasts>
