{**
 * templates/frontend/components/announcements.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of announcements
 *
 * @uses $announcements array List of announcements
 *}


<div class="grid gap-8 mb-12 md:grid-cols-2 lg:grid-cols-3">
	{foreach from=$announcements item=announcement}

			{include file="frontend/objects/announcement_front.tpl" heading="h2 class='subtitle'"}

	{/foreach}

</div>
