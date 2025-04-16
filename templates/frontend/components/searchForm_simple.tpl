{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	<div class="nav-overlay flex items-center">
		<a class="text-gray-700 hover:text-primary transition-colors flex items-center gap-2" href="#">
			<span class="sr-only">Search</span>
			<svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8" stroke-width="2"/><line x1="21" y1="21" x2="16.65" y2="16.65" stroke-width="2"/></svg>
		</a>
	</div>

	<form class="flex items-center gap-2 mt-2" action="{url page="search" op="search"}" method="post" role="search">
		<input class="border rounded px-2 py-1 w-48" name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}">
		<button type="submit" class="bg-primary text-white px-3 py-1 rounded hover:bg-accent transition-colors">
			{translate key="common.search"}
		</button>
	</form>

		{csrf}
{/if}
