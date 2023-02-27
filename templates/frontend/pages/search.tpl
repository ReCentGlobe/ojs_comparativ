{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}


<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.search"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Search
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div class="uk-grid-large uk-flex-top uk-grid-margin-large" uk-grid>

			<div class="uk-width-2-3@m">
				{* Search results, finally! *}
				<div class="search_results">
					{if $results->wasEmpty()}
					{* No results found *}
						{if $error}
							{include file="frontend/components/notification.tpl" type="error" message=$error|escape}
						{else}
							{include file="frontend/components/notification.tpl" type="notice" messageKey="search.noResults"}
						{/if}
					{else}
						<h4 class="uk-h4 uk-margin-large uk-heading-bullet" uk-scrollspy-class>
							Results
						</h4>
					{/if}
					{iterate from=results item=result}
					{assign var=issue value=$result.issue}
						<article class="uk-margin-medium uk-margin-remove-top uk-panel uk-article">
							{include file="frontend/objects/article_search.tpl" article=$result.publishedSubmission journal=$result.journal issue=$result.issue showDatePublished=true hideGalleys=true}
							<hr>
						</article>

					{/iterate}
				</div>
			</div>

			<div class="uk-width-expand@m">
				<h4 class="uk-heading-divider">Search Filter</h4>
				<form class="uk-form-stacked cmp_form" method="post" action="{url op="search"}">
					{csrf}

					{* Repeat the label text just so that screen readers have a clear
             label/input relationship *}
					<div class="search_input uk-margin">
						<label class="uk-form-label" for="query">
							{translate key="search.searchFor"}
						</label>
						<input type="text" id="query" name="query" value="{$query|escape}" class="query uk-input" placeholder="{translate|escape key="common.search"}">
					</div>

					<fieldset class="search_advanced uk-margin">
						<legend>
							{translate key="search.advancedFilters"}
						</legend>
						<div class="date_range">
							<div class="from uk-margin">
								<label class="uk-form-label">
									{translate key="search.dateFrom"}
								</label>
								{html_select_date class="uk-select uk-form-width-xsmall" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
							<div class="to uk-margin">
								<label class="uk-form-label">
									{translate key="search.dateTo"}
								</label>
								{html_select_date class="uk-select uk-form-width-xsmall" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
							</div>
						</div>
						<div class="author uk-margin">
							<label class="uk-form-label" for="authors">
								{translate key="search.author"}
							</label>
							<input class="uk-input" type="text" for="authors" name="authors" value="{$authors}">
						</div>
					</fieldset>

					<div class="submit uk-margin">
						<button class="submit uk-button uk-button-default" type="submit">{translate key="common.search"}</button>
					</div>
				</form>
			</div>

			<div class="uk-width-1-1@m">
				{if $results->wasEmpty()}
					{* No results found *}


					{* Results pagination *}
				{else}
					<div class="uk-pagination">
						{page_info iterator=$results}
						{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
					</div>
				{/if}
			</div>


		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
