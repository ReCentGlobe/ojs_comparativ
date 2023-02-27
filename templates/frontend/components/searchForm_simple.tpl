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
	<div class="nav-overlay uk-navbar-item">
		<a class="uk-navbar-toggle" uk-search-icon uk-toggle="target: .nav-overlay; animation: uk-animation-fade" href="#"><span class="uk-search-input">Search</span> </a>


	</div>

	{**
	<form class="pkp_search navbar-item" action="{url page="search" op="search"}" method="post" role="search">

		<div class="field has-addons">
			<div class="control">
				<input class="input" name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}">
			</div>
			<div class="control">
				<button type="submit" class="button is-info">
          {translate key="common.search"}
				</button>
			</div>
			<span class="icon is-large">
              <i class="fa fa-2x fa-home"></i>
            </span>
		</div>
*}

		{csrf}
{**
		<div class="search_controls" aria-hidden="true">
			<a href="{url page="search" op="search"}" class="headerSearchPrompt search_prompt" aria-hidden="true">
				{translate key="common.search"}
			</a>
			<a href="#" class="search_cancel headerSearchCancel" aria-hidden="true"></a>
			<span class="search_loading" aria-hidden="true"></span>
		</div>
	*}

{/if}
