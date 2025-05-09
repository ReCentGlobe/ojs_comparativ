{**
 * templates/frontend/objects/announcement_full.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the full view of an announcement, when the announcement is
 *  the primary element on the page.
 *
 * @uses $announcement Announcement The announcement to display
 *}

<article class="obj_announcement_full max-w-2xl mx-auto bg-white rounded shadow p-8 my-8">
	<h1 class="text-2xl font-bold mb-2">
		{$announcement->getLocalizedTitle()}
	</h1>
	<div class="date text-sm text-gray-500 mb-4">
		{$announcement->getDatePosted()|date_format:$dateFormatShort}
	</div>
	<div class="description text-gray-700">
		{if $announcement->getLocalizedDescription()}
			{$announcement->getLocalizedDescription()|strip_unsafe_html}
		{else}
			{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		{/if}
	</div>
</article><!-- .obj_announcement_full -->
