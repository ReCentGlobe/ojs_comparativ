{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}
		<h1 class="uk-h2 uk-margin-remove-top">
			Issue Archive
		</h1>
	</div>
</section>


<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">

		{if $isUserLoggedIn}
			<div id="timeline-login-App" class="uk-width-1-1">
				<timeline></timeline>
			</div>
		{else}
			<div id="timeline-App" class="uk-width-1-1">
				<timeline></timeline>
			</div>
		{/if}

		{* No issues have been published
		{if $issues->wasEmpty()}
			<p>{translate key="current.noCurrentIssueDesc"}</p>
		{else}
			<div class="columns is-multiline issues_archive">
        {iterate from=issues item=issue}

        {if $issue->getYear() != $lastYear}
					<li><h3>{$issue->getYear()|escape}</h3></li>
          {assign var=lastYear value=$issue->getYear()}
        {/if}

					<div class="column is-one-quarter">
            {include file="frontend/objects/issue_summary.tpl"}
					</div>
        {/iterate}
			</div>

			{if $issues->getPageCount() > 0}
				<div class="cmp_pagination">
					{page_info iterator=$issues}
					{page_links anchor="issues" name="issues" iterator=$issues}
				</div>
			{/if}
		{/if}

		*}

	</div>
</section>

{include file="frontend/components/footer.tpl"}
