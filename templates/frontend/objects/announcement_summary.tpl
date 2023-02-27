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

<div class="announcement column is-one-third has-text-centered">
	<{$heading}>
		<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
			{$announcement->getLocalizedTitle()|escape}
		</a>
	</{$heading}>
	<div class="date">
		{$announcement->getDatePosted()|date_format:"%d. %B %Y"}
	</div>
	<div class="summary">
		{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		<div class="has-text-left">
			<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" class="read_more button is-fullwidth is-inverted is-outlined is-primary">
			<span aria-hidden="true" role="presentation">
				{translate key="common.readMore"}
			</span>
				<span class="pkp_screen_reader">
				{translate key="common.readMoreWithTitle" title=$announcement->getLocalizedTitle()|escape}
			</span>
			</a>
		</div>
	</div>
</div><!-- .obj_announcement_summary -->
