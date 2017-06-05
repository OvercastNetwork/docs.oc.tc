---
layout: page-single

category: "Examples"
category_lead:  "XML File Examples"
title:  "Examples"

---

Commented XML files from maps in the rotation. Files are split up into their individual modules and the module's function is described. Each section contains a link [<i class="fa fa-share"></i>](#) to the relevant module's page.

<div class="alert alert-warning"><strong>Note!</strong> The XML code examples may be outdated and use depreciated features.<br/> Always check the relevant modules page to make sure that the features or specifications you intend to use are still valid.</div>

<div class="row">
    {% for map in site.data.maps %}
    <div class="col-sm-6 col-lg-3 center">
        <div id="{{ map.slug }}" class="thumbnail map-thumbnail">
            <div class="map-image" style="background-image:url('../img/examples/{{ map.slug }}.png');">
                <div class="map-banner">
                    <a href="{{ map.slug }}" class="map-name"><strong>{{ map.name }}</strong></a>
                    <span class="map-gamemode">{{ map.gamemode}}</span>
                </div>
            </div>
        </div>
    </div>
    {% endfor %}
</div>
