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

<div class="w-full md:w-1/3 p-2">
  <div class="mb-4 bg-white rounded shadow p-6 flex flex-col h-full">
      <div class="text-xs text-gray-500 mb-2">{$announcement->getDatePosted()|date_format:"%d. %B %Y"}</div>
      <h3 class="text-lg font-bold mb-2">
            <a class="text-primary hover:underline" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
              {$announcement->getLocalizedTitle()|escape}
            </a>
          </h3>
      <div class="mb-4">
        <p class="mb-4 text-gray-700">{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}</p>
      </div>
      <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" class="text-accent hover:underline font-medium">Read More</a>
  </div>
</div><!-- .obj_announcement_summary -->
