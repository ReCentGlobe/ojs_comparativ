{**
 * templates/frontend/components/breadcrumbs.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item showing the current page. This basic
 *  version is for top-level pages which only need to show the Home link. For
 *  category- and series-specific breadcrumb generation, see
 *  templates/frontend/components/breadcrumbs_catalog.tpl.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

<ul class="flex flex-wrap items-center space-x-2 text-sm text-blue-100 mb-2 overflow-x-auto whitespace-nowrap" role="navigation" aria-label="{translate key="navigation.breadcrumbLabel"}">
	<li>
		<a href="{url page="index" router=$smarty.const.ROUTE_PAGE}" class="hover:underline">
			{translate key="common.homepageNavigationLabel"}
		</a>
	</li>
	<li aria-hidden="true" class="select-none">&#8250;</li>
	<li class="font-semibold text-white">
		<a aria-current="page" href="#">
			{if $currentTitleKey}
				{translate key=$currentTitleKey|truncate:40:"..."}
			{else}
				{$currentTitle|escape|truncate:40:"..."}
			{/if}
		</a>
	</li>
</ul>
