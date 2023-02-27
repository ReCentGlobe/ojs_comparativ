{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 * @uses $heading string HTML heading element, default: h2
 *}
{if !$heading}
  {assign var="heading" value="h2"}
{/if}

<div class="uk-width-1-3@s uk-width-1-1 " uk-scrollspy-class>

  <div class="uk-margin uk-card uk-card-default uk-card-medium uk-card-body">
      <div class="uk-text-meta uk-margin uk-h6 uk-margin-remove-adjacent">{$announcement->getDatePosted()|date_format:"%d. %B %Y"}</div>
      <h3 class="uk-title uk-margin uk-h3">
            <a class="uk-link-reset" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
              {$announcement->getLocalizedTitle()|escape}
            </a>
          </h3>

      <div class="uk-margin">
        <p class="uk-margin-medium-bottom">{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}</p>
      </div>
      <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" class="uk-link">Read More</a>

  </div>

</div><!-- .obj_announcement_summary -->
