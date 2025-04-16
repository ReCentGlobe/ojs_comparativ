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

<div class="announcement w-full md:w-1/3 text-center p-4">
	<{$heading} class="text-lg font-bold mb-2">
		<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" class="text-primary hover:underline">
			{$announcement->getLocalizedTitle()|escape}
		</a>
	</{$heading}>
	<div class="date text-xs text-gray-500 mb-2">
		{$announcement->getDatePosted()|date_format:"%d. %B %Y"}
	</div>
	<div class="summary text-gray-700">
		{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		<div class="text-left mt-2">
			<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" class="block w-full border border-primary text-primary rounded px-4 py-2 hover:bg-primary hover:text-white transition-colors">
			<span aria-hidden="true" role="presentation">
				{translate key="common.readMore"}
			</span>
				<span class="sr-only">
				{translate key="common.readMoreWithTitle" title=$announcement->getLocalizedTitle()|escape}
			</span>
			</a>
		</div>
	</div>
</div><!-- .obj_announcement_summary -->
